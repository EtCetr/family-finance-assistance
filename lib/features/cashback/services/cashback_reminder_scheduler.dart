import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:timezone/timezone.dart' as tz;
import '../../../data/database/database.dart';

final _logger = Logger();

class CashbackReminderScheduler {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    
    await _notificationsPlugin.initialize(
      settings: InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );


    _logger.i('[CashbackScheduler] Инициализирован');
  }

  Future<void> scheduleReminder(CashbackReminder reminder) async {
    try {
      final scheduledDate = reminder.scheduledAt;

      if (scheduledDate.isBefore(DateTime.now())) {
        _logger.w('[CashbackScheduler] Дата в прошлом: $scheduledDate');
        return;
      }

      await _notificationsPlugin.zonedSchedule(
        id: reminder.id.hashCode, // Добавлено id:
        title: '💰 Не забудьте выбрать кэшбэк!', // Добавлено title:
        body:
            'Сегодня можно активировать выгодные категории', // Добавлено body:
        scheduledDate: tz.TZDateTime.from(
          scheduledDate,
          tz.local,
        ), // Добавлено scheduledDate:
        notificationDetails: const NotificationDetails(
          // Добавлено notificationDetails:
          android: AndroidNotificationDetails(
            'cashback_reminders',
            'Напоминания о кэшбэке',
            channelDescription: 'Уведомления о выборе кэшбэка',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        // uiLocalNotificationDateInterpretation больше не нужен и удален из плагина
        matchDateTimeComponents: DateTimeComponents.time,
      );

      _logger.i('[CashbackScheduler] Запланировано: ${reminder.id}');
    } catch (e, stackTrace) {
      _logger.e('[CashbackScheduler] Ошибка: $e');
      _logger.e('[CashbackScheduler] Stack: $stackTrace');
    }
  }


  Future<void> cancelReminder(String reminderId) async {
    await _notificationsPlugin.cancel(id: reminderId.hashCode);
    _logger.i('[CashbackScheduler] Отменено: $reminderId');
  }

  Future<void> cancelAllReminders() async {
    await _notificationsPlugin.cancelAll();
    _logger.i('[CashbackScheduler] Все напоминания отменены');
  }

  Future<void> rescheduleAllReminders(List<CashbackReminder> reminders) async {
    await cancelAllReminders();
    for (final reminder in reminders) {
      if (reminder.isEnabled) {
        await scheduleReminder(reminder);
      }
    }
    _logger.i('[CashbackScheduler] Перепланировано ${reminders.length} напоминаний');
  }
}