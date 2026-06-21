import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/analytics_providers.dart';

class BalanceCard extends ConsumerWidget {
  final String userId;

  const BalanceCard({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personalBalanceAsync = ref.watch(personalBalanceProvider(userId));
    final familyBalanceAsync = ref.watch(familyBalanceProvider(userId));
    final detailsAsync = ref.watch(personalBalanceDetailsProvider(userId));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Общий баланс', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),

            // Личный баланс
            personalBalanceAsync.when(
              data: (balance) => _BalanceRow(label: 'Личный', amount: balance),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Ошибка: $e'),
            ),

            const SizedBox(height: 8),

            // Семейный баланс
            familyBalanceAsync.when(
              data: (balance) =>
                  _BalanceRow(label: 'Семейный', amount: balance),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Ошибка: $e'),
            ),

            const SizedBox(height: 16),

            // Детализация по счетам
            detailsAsync.when(
              data: (accounts) => Column(
                children: accounts
                    .map(
                      (account) => ListTile(
                        leading: const Icon(Icons.credit_card),
                        title: Text(account.customName),
                        subtitle: Text(
                          '${account.bankName} •• ${account.cardMask}',
                        ),
                        trailing: Text(
                          '${account.balance.toStringAsFixed(2)} ${account.currency}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    )
                    .toList(),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Ошибка: $e'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BalanceRow extends StatelessWidget {
  final String label;
  final double amount;

  const _BalanceRow({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        Text(
          '${amount.toStringAsFixed(2)} ₽',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}