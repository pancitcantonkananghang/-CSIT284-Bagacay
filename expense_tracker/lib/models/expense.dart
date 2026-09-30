import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final dateFormatter = DateFormat.yMd();
const uuidGenerator = Uuid();

enum ExpenseCategory { food, travel, leisure, work, bills }

const categoryIconMap = {
  ExpenseCategory.food: Icons.restaurant,
  ExpenseCategory.travel: Icons.flight_takeoff,
  ExpenseCategory.leisure: Icons.movie_creation_outlined,
  ExpenseCategory.work: Icons.work_outline,
  ExpenseCategory.bills: Icons.receipt_long,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuidGenerator.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}