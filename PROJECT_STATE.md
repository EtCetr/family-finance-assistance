// Состояние проекта (Project State)



// 1. Файл pubspec.yaml



// https://pub.dev/packages i took fresh versions from this official site and that what i find in. don't forget to use it

name: family_financial_assistant
description: Мобильное приложение "Семейный Финансовый Ассистент" (Offline-First)
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.12.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  workmanager: ^0.9.0+3

  # State Management
  flutter_riverpod: ^3.3.2
  riverpod_annotation: ^4.0.3       

  # Database (Offline-First)
  drift: ^2.34.0
  drift_flutter: ^0.3.0  
  sqlite3: ^3.3.3
  hooks: false             
  
  # Backend & Sync
  supabase_flutter: ^2.15.0
  
  # Фоновые задачи
  flutter_background_service: ^5.1.0
  flutter_background_service_android: ^6.3.1 
  
  # Routing
  go_router: ^17.3.0                 
  
  # Security & Encryption
  flutter_secure_storage: ^10.3.1
  pointycastle: ^3.9.1
  
  # OCR (Скриншоты кэшбэка)
  google_mlkit_text_recognition: ^0.15.1
  
  # Notifications
  flutter_local_notifications: ^22.0.1
  
  # Export & Time
  excel: ^4.0.6
  timezone: ^0.11.0                  
  
  # Device Info
  device_info_plus: ^13.1.0         
  package_info_plus: ^10.1.0        

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0             
  
  # Code Generators
  build_runner: ^2.15.0             
  freezed: ^3.2.5                    
  json_serializable: ^6.14.0         
  drift_dev: ^2.34.0
  riverpod_generator: ^4.0.4

flutter:
  uses-material-design: true



// 2. Структура папок



family_finance_app/
├── lib/
│   ├── core/                          # Глобальные настройки и инфраструктура
│   │   ├── providers/                 # Глобальные Riverpod провайдеры
│   │   │   └── auth_provider.dart     # Auth state provider
│   │   ├── router/
│   │   │   └── app_router.dart
│   │   ├── theme/                     # (пока пусто, для будущих тем)
│   │   ├── utils/                     # (пока пусто, для утилит)
│   ├── data/                          # Слой данных (БД, API, репозитории)
│   │   ├── datasources/               # Local (Drift/SQLite) и Remote (Supabase)
│   │   ├── database/                  # Схемы таблиц Drift и DAO
│   │   ├── models/                    # DTO и модели сериализации
│   │   └── repositories/              # Реализации репозиториев
│   ├── domain/                        # Бизнес-логика и сущности
│   │   ├── entities/                  # Чистые сущности (без привязки к БД)
│   │   ├── repositories/              # Абстрактные интерфейсы репозиториев
│   │   └── usecases/                  # Сценарии использования
│   ├── features/                      # UI и специфичная логика фич (Feature-First)
│   │   ├── auth/
│   │   ├── dashboard/
│   │   ├── transactions/
│   │   ├── cashback/
│   │   ├── custom_dashboards/
│   │   ├── settings/
│   │   └── notifications/
│   └── main.dart                      # Точка входа
├── android/
│   └── app/
│       └── src/
│           └── main/
│               ├── jniLibs/           # Нативные библиотеки SQLite
│               │   ├── arm64-v8a/
│               │   │   └── libsqlite3.so
│               │   ├── armeabi-v7a/
│               │   │   └── libsqlite3.so
│               │   └── x86_64/
│               │       └── libsqlite3.so
│               └── AndroidManifest.xml
└── pubspec.yaml



// 3. Файл main.dart



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';

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

  // 3. WorkManager для фоновой синхронизации
  await configureWorkManager();

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




// 4. Роутер (router.dart)





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
