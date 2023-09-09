// import 'package:flutter/material.dart';
//
// // ...
//
// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Expense List'),
//       ),
//       body: FutureBuilder(
//         future: loadExpenses(), // Replace with the function to load the expenses from local storage
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
//             return Text('No expenses available.');
//           } else {
//             List<Expense> expenses = snapshot.data as List<Expense>;
//
//             return ListView.builder(
//               itemCount: expenses.length,
//               itemBuilder: (context, index) {
//                 Expense expense = expenses[index];
//                 return ListTile(
//                   title: Text(expense.expenseName),
//                   subtitle: Text(expense.description),
//                   trailing: Text('\$${expense.cost.toStringAsFixed(2)}'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Future<List<Expense>> loadExpenses() async {
//     final box = GetStorage();
//     List<Expense> expenseList = await box.read<List<Expense>>('expenseList') ?? [];
//     return expenseList;
//   }
// }
