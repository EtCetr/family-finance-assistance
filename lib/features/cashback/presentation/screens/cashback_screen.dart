import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/ocr_service.dart';
import '../widgets/cashback_progress_bar.dart';
import '../widgets/cashback_card_switcher.dart';
import 'cashback_validation_screen.dart';

/// Главный экран кэшбэка (ТЗ Раздел 6)
class CashbackScreen extends ConsumerStatefulWidget {
  const CashbackScreen({super.key});

  @override
  ConsumerState<CashbackScreen> createState() => _CashbackScreenState();
}

class _CashbackScreenState extends ConsumerState<CashbackScreen> {
  bool _isFamilyMode = false;
  final OcrService _ocrService = OcrService();

  @override
  void dispose() {
    _ocrService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Умный Кэшбэк'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: _onScanScreenshot,
          ),
        ],
      ),
      body: Column(
        children: [
          // Свитч "Свои/Семейные карты"
          CashbackCardSwitcher(
            isFamilyMode: _isFamilyMode,
            onChanged: (value) {
              setState(() {
                _isFamilyMode = value;
              });
            },
          ),

          // Прогресс-бары лимитов
          Expanded(
            child: ListView(
              children: [
                CashbackProgressBar(
                  categoryName: 'Супермаркеты',
                  earned: 1250.50,
                  limit: 3000.0,
                  percent: 5,
                ),
                CashbackProgressBar(
                  categoryName: 'Рестораны',
                  earned: 2800.00,
                  limit: 3000.0,
                  percent: 10,
                ),
                CashbackProgressBar(
                  categoryName: 'Такси',
                  earned: 3000.00,
                  limit: 3000.0,
                  percent: 7,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onScanScreenshot,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  Future<void> _onScanScreenshot() async {
    // TODO: Выбрать изображение из галереи
    // Пока используем тестовый путь
    const testImagePath = '/path/to/screenshot.png';

    final result = await _ocrService.recognizeText(testImagePath);

    if (result.status == OcrStatus.error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка распознавания: ${result.error}')),
        );
      }
      return;
    }

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CashbackValidationScreen(ocrResult: result),
        ),
      );
    }
  }
}