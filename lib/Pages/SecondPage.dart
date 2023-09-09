import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../Controllera_and_apis/ExpensesController.dart';
import '../Models/Expense.dart';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final ExpenseController expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    print("Second page rebuilt");

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (keyword) => expenseController.filterExpenses(keyword),
              decoration: InputDecoration(
                labelText: 'Search by Expense Name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Obx(
                  () => expenseController.filteredExpenses.isEmpty
                  ? Center(child: Text('No expenses available.'))
                  : ListView.builder(
                itemCount: expenseController.filteredExpenses.length,
                itemBuilder: (context, index) {
                  Expense expense = expenseController.filteredExpenses[index];
                  return ListTile(
                    title: Text(expense.expenseName),
                    subtitle: Text(expense.description),
                    trailing: Text('\$${expense.cost.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
