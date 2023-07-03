import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

enum Category {
  leisure,
  work,
  food,
  travel,
}

const categoryIcons = {
  Category.leisure: Icons.movie,
  Category.food: Icons.food_bank,
  Category.travel: Icons.airplane_ticket,
  Category.work: Icons.work,
};

const uuid = Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }

  // String getFormattedDate() {
  //   return formatter.format(date);
  // }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
