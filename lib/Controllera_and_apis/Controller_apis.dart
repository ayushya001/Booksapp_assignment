import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Colors/Appcolors.dart';
import '../Models/Expense.dart';
import '../Pages/SecondPage.dart';


class LoginController extends GetxController{
  final emailcontroller = TextEditingController();
  
  RxBool loading  = false.obs;

  void loginApi() async {
    loading.value = true;
    try{
      final dio = Dio();
      final response = await dio.post("https://staging.thenotary.app/doLogin",
        data: {
          "email" :emailcontroller.value.text,
          'password': "pistol"
        }
      );

      // eve.holt@reqres.in

      // var data = jsonDecode(response.data);

      if(response.statusCode == 200){
        loading.value = true;

        Get.snackbar("LoginSuccessfull", "Congrats",
            colorText: Colors.white,
            backgroundColor: Appcolors.Appnamecolor);

        // Parse the response data into a list of Expense objects
        List<dynamic> responseList = response.data['expenseList'];
        List<Expense> expenseList = responseList
            .map((item) => Expense.fromJson(item))
            .toList();
        // Save the response data to local storage
        final box = GetStorage();
        await box.write('expenseList', expenseList);

        Get.to(SecondPage());
        loading.value = false;

        print(response.data);
      }else{
        loading.value = false;

        Get.snackbar("oops...", "Error...");
      }
    }catch(e){

      loading.value = false;

      print("The exception is:-"+e.toString());
      
    }
  }
}