import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ticket1/repository/login/login.dart';
import 'package:ticket1/repository/user/user_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    LoginRepository repository = LoginRepository();
    String ?token  = repository.auth("ahmed@gmail.com","111111").accessToken;
    print(token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true, body: Container());
  }
}
