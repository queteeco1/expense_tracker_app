import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenseItem, required this.onRemoveExpense});
  final List<Expense> expenseItem;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseItem.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
            margin: EdgeInsets.symmetric(
              vertical: Theme.of(context).cardTheme.margin!.vertical,
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
            //margin: Theme.of(context).cardTheme.margin,
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenseItem[index]);
          },
          key: ValueKey(expenseItem[index]),
          child: ExpenseItem(
            expense: expenseItem[index],
          ),
        );
      },
    );
  }
}
