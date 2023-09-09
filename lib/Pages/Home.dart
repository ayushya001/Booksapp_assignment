import 'package:books_app_assignment/Controllera_and_apis/Controller_apis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../Colors/Appcolors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    print("Whole build");
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "BooksApp",
                style: TextStyle(
                    color: Appcolors.Appnamecolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 72,
                    fontFamily: 'cursive'),
              ),
            ),
            SizedBox(
              height: mq.height * 0.05,
            ),
            Container(
              // mq.height
              width: mq.width * 0.8,
              child: TextFormField(
                controller: controller.emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "demo@gmail.com",
                    hintStyle: TextStyle(color: Appcolors.hintTextcolor),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Appcolors.labelColor),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Appcolors.borderColorTextformfield,
                            width: 2)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Appcolors.labelColor,
                          width: 2), // Color when the TextFormField is in focus
                    ),
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Appcolors.labelColor,
                    )),
              ),
            ),
            SizedBox(
              height: mq.height * 0.05,
            ),
            Obx((){
              return ElevatedButton(
                  onPressed: () {
                    if(controller.emailcontroller.text.isEmpty){
                      Get.snackbar("BooksApp","The email cannot be empty",
                          colorText: Colors.white,
                          backgroundColor: Appcolors.Appnamecolor);

                    }else if(controller.emailcontroller.text== "demo@gmail.com"){
                      controller.loginApi();

                    }else{
                      Get.snackbar("Wrong email", "Please write correct email",
                          colorText: Colors.white,
                          backgroundColor: Appcolors.Appnamecolor);

                    }
                    // Get.toNamed("SecondPage");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Appcolors.RoundbuttonColor),
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.07)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the circular border radius here
                      ),
                    ),
                  ),
                  child: Center(
                      child: controller.loading.value ? CircularProgressIndicator(color: Colors.white,) :
                   Text("login",
                   style: TextStyle(
                     fontFamily: 'cursive',
                     fontSize: 28,
                     fontWeight: FontWeight.bold
                   ),)

                  )
              );


            }

            ),
          ],
        ),
      ),
    );
  }
}
