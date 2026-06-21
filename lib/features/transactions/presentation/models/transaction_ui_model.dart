import 'package:flutter/material.dart';

/// Плоская DTO-модель для отображения транзакции в UI.
/// Данные сюда должны приходить из UseCase/Repository после JOIN таблиц.
class TransactionUiModel {
  final String id;
  final String accountName;
  final String cardMask; // Последние 4 цифры
  final String categoryOrComment;
  final DateTime date;
  final double amount;
  final bool isIncome; // true = доход, false = расход
  final bool isRefund; // Флаг возврата (ТЗ п.8)
  final bool isHidden; // Флаг секретности (ТЗ п.12)
  final IconData categoryIcon;

  TransactionUiModel({
    required this.id,
    required this.accountName,
    required this.cardMask,
    required this.categoryOrComment,
    required this.date,
    required this.amount,
    required this.isIncome,
    this.isRefund = false,
    this.isHidden = false,
    this.categoryIcon = Icons.receipt_long,
  });

  String get formattedAmount {
    final formatted = amount
        .toStringAsFixed(2)
        .replaceAll(RegExp(r'\.00$'), '');
    final sign = isIncome ? '+ ' : '- ';
    return '$sign$formatted ₽';
  }

  String get formattedDate {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day.$month • $hour:$minute';
  }
}