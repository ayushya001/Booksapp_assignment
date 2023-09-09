import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/Expense.dart';

class ExpenseController extends GetxController {
  RxList<Expense> allExpenses = <Expense>[].obs;
  RxList<Expense> filteredExpenses = <Expense>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final box = GetStorage();
    List<Expense>? expenses = await box.read<List<Expense>>('expenseList');
    allExpenses.assignAll(expenses ?? []);
    filteredExpenses.assignAll(expenses ?? []);
  }

  void filterExpenses(String keyword) {
    filteredExpenses.assignAll(
      allExpenses.where((expense) {
        return expense.expenseName.toLowerCase().contains(keyword.toLowerCase());
      }).toList(),
    );
  }
}