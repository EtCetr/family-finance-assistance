import 'package:flutter/material.dart';

/// Свитч "Свои/Семейные карты" (ТЗ п.6.3)
class CashbackCardSwitcher extends StatelessWidget {
  final bool isFamilyMode;
  final ValueChanged<bool> onChanged;

  const CashbackCardSwitcher({
    super.key,
    required this.isFamilyMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              isFamilyMode ? Icons.family_restroom : Icons.person,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isFamilyMode ? 'Семейные карты' : 'Мои карты',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    isFamilyMode
                        ? 'Показаны карты всех членов семьи'
                        : 'Показаны только ваши карты',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Switch(value: isFamilyMode, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}