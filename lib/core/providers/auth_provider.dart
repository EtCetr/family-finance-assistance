import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Провайдер состояния авторизации
final authStateProvider = StreamProvider<AuthState>((ref) {
  final supabase = Supabase.instance.client;
  return supabase.auth.onAuthStateChange;
});

/// Провайдер текущего пользователя
final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authStateProvider);

  return authState.when(
    data: (state) => state.session?.user,
    loading: () => null,
    error: (_, _) => null, // ✅ ИСПРАВЛЕНО: (_, _) вместо (_, __)
  );
});

/// Провайдер для проверки авторизации
final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);

  return authState.when(
    data: (state) => state.session != null,
    loading: () => false,
    error: (_, _) => false, // ✅ ИСПРАВЛЕНО: (_, _) вместо (_, __)
  );
});
