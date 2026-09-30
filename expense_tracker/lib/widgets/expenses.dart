import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/budget_summary.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenseList = [
    Expense(
      title: 'Dev Tools Subscription',
      amount: 29.99,
      date: DateTime.now(),
      category: ExpenseCategory.work,
    ),
    Expense(
      title: 'Coffee & Snacks',
      amount: 8.50,
      date: DateTime.now(),
      category: ExpenseCategory.food,
    ),
  ];

  void _showAddExpenseModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addNewExpense),
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _expenseList.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final index = _expenseList.indexOf(expense);
    setState(() {
      _expenseList.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('Expense entry removed.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenseList.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No expenses recorded. Click + to add your first entry.'),
    );

    if (_expenseList.isNotEmpty) {
      content = ExpensesList(
        expenses: _expenseList,
        onRemoveExpense: _deleteExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _showAddExpenseModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          BudgetSummary(expenses: _expenseList, monthlyCap: 300.0),
          Expanded(child: content),
        ],
      ),
    );
  }
}