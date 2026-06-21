import 'package:flutter/material.dart';

/// Прогресс-бар лимита выплат (ТЗ п.6.3)
class CashbackProgressBar extends StatelessWidget {
  final String categoryName;
  final double earned;
  final double limit;
  final double percent;

  const CashbackProgressBar({
    super.key,
    required this.categoryName,
    required this.earned,
    required this.limit,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = earned / limit;
    final isLimitReached = earned >= limit;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$percent%',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Прогресс-бар
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isLimitReached
                      ? theme.colorScheme.error
                      : theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Текст под прогресс-баром
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Заработано: ${earned.toStringAsFixed(2)} ₽',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  isLimitReached
                      ? 'Лимит достигнут!'
                      : 'Лимит: ${limit.toStringAsFixed(0)} ₽',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isLimitReached
                        ? theme.colorScheme.error
                        : theme.colorScheme.onSurfaceVariant,
                    fontWeight: isLimitReached
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}