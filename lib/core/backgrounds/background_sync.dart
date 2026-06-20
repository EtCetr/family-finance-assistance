import 'package:flutter/foundation.dart';
import 'package:workmanager/workmanager.dart';
import '../../data/database/database.dart';
import '../../data/datasources/supabase_client.dart';
import '../../data/repositories/sync_engine.dart';

/// Фоновая задача синхронизации
/// Запускается WorkManager каждые 15 минут
@pragma('vm:entry-point')
void backgroundSyncTask() {
  Workmanager().executeTask((task, inputData) async {
    try {
      debugPrint('[BackgroundSync] Задача началась: ${DateTime.now()}');

      // Инициализация внутри background isolate
      final supabase = await SupabaseClientService.initialize(
        url: 'https://dawspwixosrpefioihrf.supabase.co',
        anonKey: 'sb_publishable_AlWLcTp8Cal0BryYDI6S9Q_UQPEO5yc',
      );

      final database = AppDatabase();
      final syncEngine = SyncEngine(
        localDb: database,
        supabaseClient: supabase,
      );

      // Запуск синхронизации
      final result = await syncEngine.syncPendingData();

      debugPrint('[BackgroundSync] Результат: $result');

      return Future.value(result.success);
    } catch (e) {
      debugPrint('[BackgroundSync] Ошибка: $e');
      return Future.value(false);
    }
  });
}

/// Настройка WorkManager
Future<void> configureBackgroundSync() async {
  await Workmanager().initialize(
    backgroundSyncTask,
    // ✅ Убрали deprecated isInDebugMode
  );

  // Регистрация периодической задачи
  await Workmanager().registerPeriodicTask(
    'sync-pending-data',
    'sync-pending-data',
    // Минимальный интервал в Android — 15 минут
    frequency: const Duration(minutes: 15),
    // ✅ Убрали const перед Constraints
    constraints: Constraints(
      networkType: NetworkType.connected,
      requiresBatteryNotLow: false,
      requiresCharging: false,
      requiresDeviceIdle: false,
      requiresStorageNotLow: false,
    ),
    // Android-specific настройки
    initialDelay: const Duration(minutes: 5),
    backoffPolicy: BackoffPolicy.exponential,
    backoffPolicyDelay: const Duration(minutes: 5),
  );

  debugPrint('[BackgroundSync] WorkManager настроен (интервал: 15 мин)');
}

/// Отключение фоновой синхронизации
Future<void> cancelBackgroundSync() async {
  await Workmanager().cancelByUniqueName('sync-pending-data');
  debugPrint('[BackgroundSync] Фоновая синхронизация отключена');
}