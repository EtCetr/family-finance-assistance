import 'package:flutter/material.dart';
import '../models/transaction_ui_model.dart';

class TransactionActionsSheet extends StatelessWidget {
  final TransactionUiModel transaction;
  final ValueChanged<String> onActionSelected;

  const TransactionActionsSheet({
    super.key,
    required this.transaction,
    required this.onActionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      clipBehavior:
          Clip.antiAlias, // Важно: обрезает дочерние элементы по скруглению
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle (MD3)
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Text(
              'Действия с операцией',
              style: theme.textTheme.titleLarge,
            ),
          ),
          const Divider(height: 1),

          // Опции меню согласно ТЗ
          _buildActionTile(
            context,
            icon: Icons.visibility_off_outlined,
            title: 'Засекретить (Подарок)',
            action: 'hide_gift',
            color: theme.colorScheme.primary,
          ),
          _buildActionTile(
            context,
            icon: Icons.cancel_outlined,
            title: 'Исключить из учёта (Сторно)',
            action: 'exclude',
            color: theme.colorScheme.error,
          ),
          _buildActionTile(
            context,
            icon: Icons.assignment_return_outlined,
            title: 'Пометить как возврат',
            action: 'mark_refund',
            color: theme.colorScheme.tertiary,
          ),
          _buildActionTile(
            context,
            icon: Icons.edit_note_outlined,
            title: 'Изменить категорию',
            action: 'change_category',
            color: theme.colorScheme.onSurface,
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }

  Widget _buildActionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String action,
    required Color color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      onTap: () => onActionSelected(action),
    );
  }
}