import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

// ==========================================
// ЗАГЛУШКИ ЭКРАНОВ
// ==========================================

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Экран Авторизации')));
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Главная / Дашборд')));
}

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Лог Операций')));
}

class CashbackScreen extends StatelessWidget {
  const CashbackScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Умный Кэшбэк')));
}

class CustomDashboardsScreen extends StatelessWidget {
  const CustomDashboardsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Кастомные Вкладки')));
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Настройки')));
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Уведомления')));
}

// ==========================================
// КОНФИГУРАЦИЯ РОУТЕРА
// ==========================================

final appRouterProvider = Provider<GoRouter>((ref) {
  // Следим за состоянием авторизации
  final isLoggedIn = ref.watch(isLoggedInProvider);

  return GoRouter(
    initialLocation: '/dashboard',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/transactions',
        builder: (context, state) => const TransactionsScreen(),
      ),
      GoRoute(
        path: '/cashback',
        builder: (context, state) => const CashbackScreen(),
      ),
      GoRoute(
        path: '/custom_dashboards',
        builder: (context, state) => const CustomDashboardsScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
    ],
    redirect: (context, state) {
      final isAuthRoute = state.matchedLocation == '/auth';

      // Если не авторизован и не на экране логина → редирект на логин
      if (!isLoggedIn && !isAuthRoute) {
        return '/auth';
      }

      // Если авторизован и на экране логина → редирект на дашборд
      if (isLoggedIn && isAuthRoute) {
        return '/dashboard';
      }

      return null;
    },
  );
});
