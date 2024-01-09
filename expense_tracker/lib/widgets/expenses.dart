import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expense_lists/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  //final List<Expense> registeredExpenses = [];
  final List<Expense> registeredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 450,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'cinema',
        amount: 299,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Pizza',
        amount: 349,
        date: DateTime.now(),
        category: Category.food),
  ];

  void _openAddExpensePage() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(onAddExpense: _addExpense);
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No expenses found. Press + to add some!"),
    );
    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpensePage,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: totalWidth < 600
          ? Column(
              children: [
                Chart(expenses: registeredExpenses),
                Expanded(
                  child: mainContent,
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                )
              ],
            ),
    );
  }
}
