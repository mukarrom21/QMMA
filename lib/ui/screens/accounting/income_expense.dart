import 'package:flutter/material.dart';

class IncomeExpense extends StatefulWidget {
  const IncomeExpense({super.key});

  @override
  State<IncomeExpense> createState() => _IncomeExpenseState();
}

class _IncomeExpenseState extends State<IncomeExpense> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Income Expense'),
    );
  }
}
