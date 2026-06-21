import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/ocr_service.dart';

/// Экран пред-валидации OCR (ТЗ п.6.2)
class CashbackValidationScreen extends ConsumerStatefulWidget {
  final OcrResult ocrResult;

  const CashbackValidationScreen({super.key, required this.ocrResult});

  @override
  ConsumerState<CashbackValidationScreen> createState() =>
      _CashbackValidationScreenState();
}

class _CashbackValidationScreenState
    extends ConsumerState<CashbackValidationScreen> {
  late List<CashbackItem> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.ocrResult.items);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Проверьте распознавание'),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _onApprove),
        ],
      ),
      body: Column(
        children: [
          // Информация о статусе
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: theme.colorScheme.primaryContainer,
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Проверьте распознанные данные. Вы можете отредактировать поля перед сохранением.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Список элементов
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return _CashbackItemCard(
                  item: item,
                  onChanged: (updatedItem) {
                    setState(() {
                      _items[index] = updatedItem;
                    });
                  },
                );
              },
            ),
          ),

          // Кнопки действий
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Отмена'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _onApprove,
                    child: const Text('Сохранить'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onApprove() {
    // TODO: Сохранить в БД со статусом approved
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Кэшбэк сохранён')));
    Navigator.pop(context, _items.where((item) => item.isSelected).toList());
  }
}

/// Карточка элемента кэшбэка с редактируемыми полями
class _CashbackItemCard extends StatefulWidget {
  final CashbackItem item;
  final ValueChanged<CashbackItem> onChanged;

  const _CashbackItemCard({required this.item, required this.onChanged});

  @override
  State<_CashbackItemCard> createState() => _CashbackItemCardState();
}

class _CashbackItemCardState extends State<_CashbackItemCard> {
  late TextEditingController _merchantController;
  late TextEditingController _amountController;
  late TextEditingController _percentController;

  @override
  void initState() {
    super.initState();
    _merchantController = TextEditingController(text: widget.item.merchantName);
    _amountController = TextEditingController(
      text: widget.item.amount.toString(),
    );
    _percentController = TextEditingController(
      text: widget.item.percent.toString(),
    );
  }

  @override
  void dispose() {
    _merchantController.dispose();
    _amountController.dispose();
    _percentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Чекбокс выбора
            Row(
              children: [
                Checkbox(
                  value: widget.item.isSelected,
                  onChanged: (value) {
                    widget.item.isSelected = value ?? true;
                    widget.onChanged(widget.item);
                  },
                ),
                const Expanded(
                  child: Text(
                    'Включить в кэшбэк',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),

            // Поле магазина
            TextField(
              controller: _merchantController,
              decoration: const InputDecoration(
                labelText: 'Магазин',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                widget.item.merchantName = value;
                widget.onChanged(widget.item);
              },
            ),
            const SizedBox(height: 8),

            // Сумма и процент
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: 'Сумма (₽)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      widget.item.amount = double.tryParse(value) ?? 0.0;
                      widget.onChanged(widget.item);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _percentController,
                    decoration: const InputDecoration(
                      labelText: 'Процент (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      widget.item.percent = int.tryParse(value) ?? 0;
                      widget.onChanged(widget.item);
                    },
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