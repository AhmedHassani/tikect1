import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:ticket1/AllScreen/login/LoginPage.dart';

class Welcome extends StatefulWidget {
  Welcomestate createState() => Welcomestate();
}

class Welcomestate extends State<Welcome> {
  String token = '0';
  String userid = '';
  String full_name = '';
  String img = '';
  late Future<String> _counter;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.to(()=>Login());
    });
    /*
    _counter = _prefs.then((SharedPreferences prefs) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (token != "0") {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Home(token, userid, full_name, img)),
              (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Login()),
              (Route<dynamic> route) => false);
        }
      });
      return (token);
    });
     */
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var colorthime = Color(int.parse("0xff131630"));
    var amber = Colors.amber[800];
    return Scaffold(
      body: Container(
        color: colorthime,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: screenHeight * 0.2,
            ),
            Center(
              child: Image.asset(
                "assets/images/dish2.png",
                height: screenHeight * 0.2,
                width: screenWidth * 0.5,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.3,
            ),
            Column(
              children: [
                Container(
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.2,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      size: 66,
                      spinnerMode: true,
                      animationEnabled: true,
                      customColors: CustomSliderColors(
                        hideShadow: false,
                        trackColor: Colors.white.withOpacity(0.1),
                        dotColor: Color(0XFF333333),
                        progressBarColor: Color(0XFFffffff),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Center(
                  child: Text("Dishtelecom",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        color: amber,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Center(
                  child: Text("MGM",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        color: amber,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: screenWidth * 0.055,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
