import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction_ui_model.dart';
import '../widgets/transaction_card.dart';

// TODO: Замените на реальный Provider из repositories/
final transactionsListProvider = Provider<List<TransactionUiModel>>((ref) {
  return MockData.transactions;
});

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsListProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Лог операций'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Открыть фильтр/поиск
            },
          ),
        ],
      ),
      body: transactions.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 64,
                    color: theme.colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text('Операций пока нет', style: theme.textTheme.titleLarge),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionCard(
                  transaction: transactions[index],
                  onActionSelected: (action) {
                    _handleAction(context, transactions[index], action);
                  },
                );
              },
            ),
    );
  }

  void _handleAction(
    BuildContext context,
    TransactionUiModel tx,
    String action,
  ) {
    // TODO: Вызов UseCase для изменения состояния в БД (Drift)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Действие "$action" для транзакции ${tx.id}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

// ==========================================
// MOCK DATA (Для демонстрации верстки)
// ==========================================
class MockData {
  static final List<TransactionUiModel> transactions = [
    TransactionUiModel(
      id: '1',
      accountName: 'T-Bank Black',
      cardMask: '4321',
      categoryOrComment: 'Продукты / Пятёрочка',
      date: DateTime.now().subtract(const Duration(hours: 2)),
      amount: 1540.50,
      isIncome: false,
      categoryIcon: Icons.shopping_cart,
    ),
    TransactionUiModel(
      id: '2',
      accountName: 'Сбербанк *1234',
      cardMask: '1234',
      categoryOrComment: 'Зарплата',
      date: DateTime.now().subtract(const Duration(days: 1)),
      amount: 85000.00,
      isIncome: true,
      categoryIcon: Icons.work,
    ),
    TransactionUiModel(
      id: '3',
      accountName: 'Альфа-Банк',
      cardMask: '5678',
      categoryOrComment: 'Кафе / Кофе с собой',
      date: DateTime.now().subtract(const Duration(days: 2)),
      amount: 350.00,
      isIncome: false,
      isRefund: false,
      categoryIcon: Icons.restaurant,
    ),
    TransactionUiModel(
      id: '4',
      accountName: 'Наличные',
      cardMask: '----',
      categoryOrComment: 'Подарок Кате 🎁',
      date: DateTime.now().subtract(const Duration(days: 3)),
      amount: 5000.00,
      isIncome: false,
      isHidden: true, // Засекречено (ТЗ п.12)
      categoryIcon: Icons.card_giftcard,
    ),
  ];
}