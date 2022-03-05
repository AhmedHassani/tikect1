import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ticket1/AllScreen/home/Home.dart';

class Login extends StatefulWidget {
  Loginstate createState() => Loginstate();
}

class Loginstate extends State<Login> {
  String token = '0';
  String userid = '';
  String full_name = '';
  String img = '';

  String userError = '';
  String passError = '';

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  late Future<String> _counter;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    // var colorthime = Mycolor().colorthime;
    var colorthime = Color(int.parse("0xff131630"));
    var amber = Colors.amber[800];
    var colorthime2 = Color(int.parse("0xff181c3c"));

    return Scaffold(
      body: Container(
        color: colorthime,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: screenWidth * 0.25,
            ),
            Center(
              child: SvgPicture.asset('assets/images/loginsvg.svg',
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.6,
                  semanticsLabel: 'loginsvg'),
            ),
            SizedBox(
              height: screenWidth * 0.05,
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
              height: screenWidth * 0.1,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(
                  screenWidth * 0.05,
                ),
                padding: EdgeInsets.all(
                  screenWidth * 0.04,
                ),
                // height: screenHeight * 0.4,
                width: screenWidth * 0.85,
                decoration: BoxDecoration(
                  color: colorthime,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 30),
                      padding: EdgeInsets.only(left: 9, right: 9, bottom: 12),
                      decoration: BoxDecoration(
                        color: colorthime2,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        // textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        // obscureText: true,
                        textAlign: TextAlign.left,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,

                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.65),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          // enabledBorder: InputBorder.none,
                          //      errorText: userError,

                          hintText: "User Name",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.65),
                            fontWeight: FontWeight.w500,
                          ),
                          icon: Icon(
                            Icons.person,
                            color: Colors.white.withOpacity(0.65),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 30,
                      ),
                      padding: EdgeInsets.only(left: 9, right: 9, bottom: 12),
                      decoration: BoxDecoration(
                        color: colorthime2,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        // textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        obscureText: true,
                        textAlign: TextAlign.left,
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,

                        decoration: InputDecoration(
                          //    errorText: passError,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.65),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          // enabledBorder: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.65),
                            fontWeight: FontWeight.w500,
                          ),
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.white.withOpacity(0.65),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: login,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                        ),
                        padding: EdgeInsets.only(
                            left: 9, right: 9, bottom: 20, top: 20),
                        decoration: BoxDecoration(
                          color: colorthime2.withOpacity(0.88),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Text(
                          "LOGIN TO WORK",
                          style: TextStyle(
                            fontSize: 16,
                            color: amber,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      padding: EdgeInsets.only(
                          left: 9, right: 9, bottom: 10, top: 10),
                      decoration: BoxDecoration(
                        color: colorthime2.withOpacity(0.0),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Text(
                        "This entry is for company users only",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenWidth * 0.035,
            )
          ],
        ),
      ),
    );
  }

  Future<void> save_userData() async {
    /*
    final SharedPreferences prefs = await _prefs;
    _counter = prefs.setString("userid", "$userid").then((bool success) {
      print("userid done");
      return "";
    });
     */
  }

  Future<void> save_full_name() async {
    /*
    final SharedPreferences prefs = await _prefs;
    _counter = prefs.setString("full_name", "$full_name").then((bool success) {
      print("full_name done");
      return "";
    });
     */
  }

  Future<void> save_img() async {
    /*
    final SharedPreferences prefs = await _prefs;
    _counter = prefs.setString("img", "$img").then((bool success) {
      print("img done");
      return "";
    });
     */
  }

  Future<void> save_tokin() async {
  }

  Future<void> signInApi(String email, pass) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://mgm1.dishtele.com/api/v1/users/login'));
      request.fields.addAll({'username': '${email}', 'password': '${pass}'});
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(await response.stream.bytesToString());
        token = "${jsonResponse['message']['token']}";

        userid = "${jsonResponse['message']['userData']["id"]}";
        full_name = "${jsonResponse['message']['userData']["full_name"]}";
        img = "${jsonResponse['message']['userData']["img"]}";

        save_userData();
        save_tokin();
        save_full_name();
        save_img();

        save_tokin();
     /*
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => Home(
                      token,
                      userid,
                      full_name,
                      img,
                    )),
            (Route<dynamic> route) => false);
        EasyLoading.showSuccess('تم تسجيل الدخول');
      */
      } else {
        mysnackbar("UserName and Password do Not match");
        _emailController.clear();
        _passwordController.clear();
        print('Response body : ${response.reasonPhrase}');
        print(response.reasonPhrase);
      }

      print(response.statusCode);
    } on Exception catch (exception) {
      _showerroeDialog();
      print("exception  ${exception}");
    } catch (error) {
      _showerroeDialog();
      print("error  ${error}");
    }
  }

  login() async {
    Get.to(()=>Home("","","",""));
    // if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
    //   userError = "Enter UserName Please ";
    //   passError = "Enter Password Please ";
    // } else if (_emailController.text.isEmpty) {
    //   userError = "Enter UserName Please ";
    // } else if (_passwordController.text.isEmpty) {
    //   passError = "Enter Password Please ";
    // } else {FocusScope.of(context).unfocus();
   // FocusScope.of(context).unfocus();

    //EasyLoading.show(status: 'تحميل...');

    //   EasyLoading.showSuccess('Use in initState');
    await signInApi(
        _emailController.text.trim(), _passwordController.text.trim());
    //EasyLoading.dismiss();
//    }
  }

  mysnackbar(String msgSnamkBar) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Code to execute.
          },
        ),
        content: Text('$msgSnamkBar'),
        duration: const Duration(milliseconds: 2000),
        width: 280.0, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  _showerroeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: SingleChildScrollView(
                  child: Column(
                children: [
                  Text("هناك مشكلة بالأتصال بالانترنت"),
                ],
              )),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("اعادة تحميل"),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                  child: Text("اغلاق"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
