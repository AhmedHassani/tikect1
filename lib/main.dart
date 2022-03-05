import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AllScreen/SplashScreen/Welcome.dart';
import 'AllScreen/SplashScreen/splash_ui.dart';
import 'Services/binds.dart';
import 'Style/app_color.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ColorController.light,
      darkTheme: ColorController.dark,
      initialBinding: Bind(),
      home: Welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
