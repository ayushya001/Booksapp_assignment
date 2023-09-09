import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';

import 'Pages/Home.dart';
import 'Pages/SecondPage.dart';

void main() async {
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      getPages: [
        GetPage(name: '/', page: ()=> Home()),
        GetPage(name: '/SecondPage', page: ()=> SecondPage()),
    ],

    );
  }
}

