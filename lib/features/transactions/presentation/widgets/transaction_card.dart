import 'package:flutter/material.dart';
import '../models/transaction_ui_model.dart';
import 'transaction_actions_sheet.dart';

class TransactionCard extends StatelessWidget {
  final TransactionUiModel transaction;
  final ValueChanged<String> onActionSelected;

  const TransactionCard({
    super.key,
    required this.transaction,
    required this.onActionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Цвет суммы: зелёный для доходов, красный для расходов (согласно ТЗ)
    final amountColor = transaction.isIncome
        ? const Color(0xFF2E7D32) // MD3 Green
        : theme.colorScheme.error; // MD3 Red/Error

    return GestureDetector(
      onLongPress: () => _showContextMenu(context),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        elevation: 0,
        color: theme.colorScheme.surfaceContainerLow, // MD3 Card Background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // === ЛЕВАЯ ЧАСТЬ: Иконка + Счёт + Маска ===
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      transaction.categoryIcon,
                      color: theme.colorScheme.onPrimaryContainer,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${transaction.accountName} •• ${transaction.cardMask}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 16),

              // === ЦЕНТР: Комментарий/Категория + Время ===
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            transaction.categoryOrComment,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (transaction.isHidden) ...[
                          const SizedBox(width: 4),
                          Icon(
                            Icons.visibility_off,
                            size: 16,
                            color: theme.colorScheme.outline,
                          ),
                        ],
                        if (transaction.isRefund) ...[
                          const SizedBox(width: 4),
                          Icon(
                            Icons.assignment_return,
                            size: 16,
                            color: theme.colorScheme.tertiary,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction.formattedDate,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // === ПРАВАЯ ЧАСТЬ: Сумма ===
              Text(
                transaction.formattedAmount,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: amountColor,
                  fontWeight: FontWeight.bold,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showContextMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => TransactionActionsSheet(
        transaction: transaction,
        onActionSelected: (action) {
          Navigator.pop(ctx);
          onActionSelected(action);
        },
      ),
    );
  }
}