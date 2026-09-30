import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class BudgetSummary extends StatelessWidget {
  const BudgetSummary({
    super.key,
    required this.expenses,
    required this.monthlyCap,
  });

  final List<Expense> expenses;
  final double monthlyCap;

  double get totalSpend {
    return expenses.fold(0.0, (sum, item) => sum + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    final progressFraction = (totalSpend / monthlyCap).clamp(0.0, 1.0);
    final isExceeded = totalSpend > monthlyCap;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Spending Monitor',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '\$${totalSpend.toStringAsFixed(2)} / \$${monthlyCap.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isExceeded ? Theme.of(context).colorScheme.error : Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progressFraction,
                minHeight: 12,
                backgroundColor: Colors.grey[300],
                color: isExceeded
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}