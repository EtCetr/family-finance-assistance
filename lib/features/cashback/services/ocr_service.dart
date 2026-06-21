import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

/// Сервис OCR для распознавания скриншотов кэшбэка
class OcrService {
  final TextRecognizer _textRecognizer = TextRecognizer();

  /// Распознать текст из изображения
  Future<OcrResult> recognizeText(String imagePath) async {
    try {
      _logger.i('[OCR] Начинаю распознавание: $imagePath');

      final inputImage = InputImage.fromFilePath(imagePath);
      final recognizedText = await _textRecognizer.processImage(inputImage);

      _logger.i('[OCR] Распознано ${recognizedText.blocks.length} блоков');

      // Парсим распознанный текст
      final cashbackItems = _parseCashbackItems(recognizedText);

      return OcrResult(
        rawText: recognizedText.text,
        items: cashbackItems,
        status: OcrStatus.potentialDraft,
      );
    } catch (e, stackTrace) {
      _logger.e('[OCR] Ошибка распознавания: $e');
      _logger.e('[OCR] Stack: $stackTrace');
      return OcrResult(
        rawText: '',
        items: [],
        status: OcrStatus.error,
        error: e.toString(),
      );
    }
  }

  /// Парсинг распознанного текста в структуру кэшбэка
  List<CashbackItem> _parseCashbackItems(RecognizedText text) {
    final items = <CashbackItem>[];

    for (final block in text.blocks) {
      for (final line in block.lines) {
        // Пример: "Пятёрочка  1 250.50 ₽  5%  62.53 ₽"
        final parsed = _parseCashbackLine(line.text);
        if (parsed != null) {
          items.add(parsed);
        }
      }
    }

    return items;
  }

  /// Парсинг одной строки кэшбэка
  CashbackItem? _parseCashbackLine(String line) {
    // Упрощённый парсер (в реальности нужна сложная regex-логика)
    final regex = RegExp(
      r'(.+?)\s+(\d+[.,]?\d*)\s*₽?\s+(\d+)%\s+(\d+[.,]?\d*)\s*₽?',
    );
    final match = regex.firstMatch(line);

    if (match == null) return null;

    return CashbackItem(
      merchantName: match.group(1)?.trim() ?? '',
      amount: double.tryParse(match.group(2)!.replaceAll(',', '.')) ?? 0.0,
      percent: int.tryParse(match.group(3)!) ?? 0,
      cashbackAmount:
          double.tryParse(match.group(4)!.replaceAll(',', '.')) ?? 0.0,
    );
  }

  /// Освободить ресурсы
  void dispose() {
    _textRecognizer.close();
  }
}

/// Результат OCR
class OcrResult {
  final String rawText;
  final List<CashbackItem> items;
  final OcrStatus status;
  final String? error;

  OcrResult({
    required this.rawText,
    required this.items,
    required this.status,
    this.error,
  });
}

/// Элемент кэшбэка
class CashbackItem {
  String merchantName;
  double amount;
  int percent;
  double cashbackAmount;
  bool isSelected;

  CashbackItem({
    required this.merchantName,
    required this.amount,
    required this.percent,
    required this.cashbackAmount,
    this.isSelected = true,
  });
}

/// Статус OCR
enum OcrStatus { potentialDraft, approved, error }