import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/database.dart';
import '../../data/datasources/supabase_client.dart';
import '../../data/repositories/sync_engine.dart';

/// Провайдер Supabase клиента (остается FutureProvider)
final supabaseClientProvider = FutureProvider<SupabaseClientService>((
  ref,
) async {
  return await SupabaseClientService.initialize(
    url: 'https://dawspwixosrpefioihrf.supabase.co',
    anonKey: 'sb_publishable_AlWLcTp8Cal0BryYDI6S9Q_UQPEO5yc',
  );
});

/// Провайдер AppDatabase
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final syncEngineProvider = Provider<SyncEngine?>((ref) {
  final database = ref.watch(appDatabaseProvider);
  final supabaseAsync = ref.watch(supabaseClientProvider);

  return supabaseAsync.when(
    data: (supabase) => SyncEngine(localDb: database, supabaseClient: supabase),
    loading: () => null, // Возвращаем null, пока идет инициализация сети
    error: (_, _) => null,
  );
});

final syncStatusProvider = NotifierProvider<SyncStatusNotifier, SyncState>(() {
  return SyncStatusNotifier();
});

class SyncStatusNotifier extends Notifier<SyncState> {
  @override
  SyncState build() {
    return const SyncState();
  }

  /// Запустить синхронизацию
  Future<void> sync() async {
    final syncEngine = ref.read(syncEngineProvider);

    // Если Supabase еще не проинициализировался, прерываем выполнение
    if (syncEngine == null) {
      state = state.copyWith(
        error: 'Синхронизация невозможна: Supabase еще не готов',
      );
      return;
    }

    state = state.copyWith(isSyncing: true);

    try {
      final result = await syncEngine.syncPendingData();

      state = state.copyWith(
        isSyncing: false,
        lastSyncTime: DateTime.now(),
        syncedCount: result.syncedCount,
        conflictCount: result.conflictCount,
        error: result.error,
      );
    } catch (e) {
      state = state.copyWith(isSyncing: false, error: e.toString());
    }
  }

  /// Получить количество pending
  Future<void> refreshPendingCount() async {
    final syncEngine = ref.read(syncEngineProvider);
    if (syncEngine == null) return;

    final count = await syncEngine.getPendingCount();
    state = state.copyWith(pendingCount: count);
  }
}

/// Класс состояния
class SyncState {
  final bool isSyncing;
  final int pendingCount;
  final int syncedCount;
  final int conflictCount;
  final DateTime? lastSyncTime;
  final String? error;

  const SyncState({
    this.isSyncing = false,
    this.pendingCount = 0,
    this.syncedCount = 0,
    this.conflictCount = 0,
    this.lastSyncTime,
    this.error,
  });

  SyncState copyWith({
    bool? isSyncing,
    int? pendingCount,
    int? syncedCount,
    int? conflictCount,
    DateTime? lastSyncTime,
    String? error,
  }) {
    return SyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      pendingCount: pendingCount ?? this.pendingCount,
      syncedCount: syncedCount ?? this.syncedCount,
      conflictCount: conflictCount ?? this.conflictCount,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      error: error ?? this.error,
    );
  }
}
