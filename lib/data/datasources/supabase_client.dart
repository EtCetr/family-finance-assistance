import 'package:supabase_flutter/supabase_flutter.dart';

/// Singleton клиент для работы с Supabase
class SupabaseClientService {
  static SupabaseClientService? _instance;
  late final SupabaseClient _client;

  SupabaseClientService._();

  /// Инициализация клиента (вызывать из main.dart)
  static Future<SupabaseClientService> initialize({
    required String url,
    required String anonKey,
  }) async {
    if (_instance != null) return _instance!;

    await Supabase.initialize(url: url, publishableKey: anonKey);

    _instance = SupabaseClientService._();
    _instance!._client = Supabase.instance.client;

    return _instance!;
  }

  /// Получить экземпляр клиента
  SupabaseClient get client {
    if (_instance == null) {
      throw Exception('SupabaseClientService не инициализирован');
    }
    return _instance!._client;
  }

  /// Проверка подключения
  Future<bool> isConnected() async {
    try {
      await _client.from('spaces').select().limit(1);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Получить текущего пользователя
  User? get currentUser => _client.auth.currentUser;

  /// Stream auth состояния
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}