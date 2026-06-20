import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';
import 'core/backgrounds/background_sync.dart';
import 'core/router/app_router.dart';
// ============================================================
// 1. WORKMANAGER (фоновая синхронизация БЕЗ уведомлений)
// ============================================================

/// Фоновая задача для синхронизации с Supabase.
/// Запускается системой Android/iOS, когда это удобно (экономия батареи).
@pragma('vm:entry-point')
void backgroundSyncTask() {
  Workmanager().executeTask((task, inputData) async {
    try {
      debugPrint('[WorkManager] Синхронизация началась в ${DateTime.now()}');

      // Инициализация Supabase внутри background isolate
      await Supabase.initialize(
        url: 'https://dawspwixosrpefioihrf.supabase.co',
        publishableKey: 'sb_publishable_AlWLcTp8Cal0BryYDI6S9Q_UQPEO5yc',
      );

      // TODO: Здесь будет логика синхронизации Drift <-> Supabase
      // final database = AppDatabase();
      // final pendingTransactions = await database.getPendingTransactions();
      // await syncToSupabase(pendingTransactions);

      debugPrint('[WorkManager] Синхронизация завершена');
      return Future.value(true);
    } catch (e) {
      debugPrint('[WorkManager] Ошибка синхронизации: $e');
      return Future.value(false);
    }
  });
}

/// Настройка WorkManager
Future<void> configureWorkManager() async {
  await Workmanager().initialize(
    backgroundSyncTask,
    // ✅ В workmanager 0.9.0+3 параметр debugConfig убрали
    // Отладка включается автоматически в debug режиме
  );

  // Запускаем периодическую синхронизацию
  await Workmanager().registerPeriodicTask(
    'sync-transactions',
    'sync-transactions',
    frequency: const Duration(minutes: 30),
    constraints: Constraints(
      networkType: NetworkType.connected,
      requiresBatteryNotLow: true,
      requiresCharging: false,
    ),
  );
}

// ============================================================
// 2. ЛОКАЛЬНЫЕ УВЕДОМЛЕНИЯ
// ============================================================

final FlutterLocalNotificationsPlugin localNotifications =
    FlutterLocalNotificationsPlugin();

Future<void> initializeNotifications() async {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.local);

  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const iosSettings = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  await localNotifications.initialize(
    settings: const InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    ),
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      debugPrint('[Notification] Нажато: ${response.payload}');
    },
  );

  if (Platform.isAndroid) {
    final plugin = localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await plugin?.requestNotificationsPermission();
  }
}

// ============================================================
// 3. ТОЧКА ВХОДА
// ============================================================

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Уведомления
  await initializeNotifications();

  // 2. Supabase (в основном isolate)
  await Supabase.initialize(
    url: 'https://ВАШ-ПРОЕКТ.supabase.co',
    publishableKey: 'ВАШ-PUBLISHABLE-KEY',
  );

  // 3. Фоновая синхронизация (WorkManager)
  await configureBackgroundSync();

  // 4. TODO: Инициализация Drift
  // final database = AppDatabase();

  // 5. Запуск приложения
  runApp(const ProviderScope(child: FamilyFinanceApp()));
}

// ============================================================
// 4. КОРНЕВОЙ WIDGET
// ============================================================

class FamilyFinanceApp extends ConsumerWidget {
  const FamilyFinanceApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Семейный Финансовый Ассистент',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}