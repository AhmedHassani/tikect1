
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Dashboard extends StatefulWidget {
  Dashboard();
  Dashboardstate createState() => Dashboardstate();
}

class Dashboardstate extends State<Dashboard> {
  //all variable
  String agentCount = "0";
  String dailyWork_Count = "0";
  String Tickets_Wating_Count = "0";
  String Tickets_solved_Count = "0";
  String Tickets_canseled_Count = "0";
  String CarsCount = "0";
  String RepeatersCount = "0";
  String EmployeeCount = "0";

  late Future<String> _counter;
  @override
  void initState() {
    getListOfReports();
    super.initState();
  }

  @override
  void dispose() {
    // EasyLoading.dismiss();
    super.dispose();
  }
  var colorthime = Color(int.parse("0xff131630"));
  var amber = Colors.amber[800];
  var colorthime2 = Color(int.parse("0xff181c3c"));
  var white = Colors.white;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var ContainerHeight = MediaQuery.of(context).size.height * 0.23;
    var height1 = AppBar().preferredSize.height;

   // var colorthime = Mycolor().colorthime;
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: colorthime,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: screenWidth * 0.01,
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                             /* Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AgentsCard(widget.token)),
                                      (Route<dynamic> route) => true);*/
                            },
                            child: Container(
                              margin: EdgeInsets.all(
                                screenWidth * 0.035,
                              ),
                              height: ContainerHeight,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: colorthime,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.085,
                                    // width: screenWidth * 0.35,
                                    child: SvgPicture.asset('assets/images/Agents.svg',
                                        semanticsLabel: 'Agents'),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Agents",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("$agentCount",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: amber,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {

                            },
                            child: Container(
                              margin: EdgeInsets.all(
                                screenWidth * 0.035,
                              ),
                              height: ContainerHeight,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: colorthime,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.085,
                                    //width: screenWidth * 0.35,
                                    child: SvgPicture.asset('img/employess.svg',
                                        semanticsLabel: 'Agents'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Employees",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("$EmployeeCount",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: amber,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                            },
                            child: Container(
                              margin: EdgeInsets.all(
                                screenWidth * 0.035,
                              ),
                              height: ContainerHeight,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: colorthime,

                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.085,
                                    child: SvgPicture.asset('img/Waiting.svg',
                                        semanticsLabel: 'Agents'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Tickets Waiting",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("$Tickets_Wating_Count",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: amber,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {

                            },
                            child: Container(
                              margin: EdgeInsets.all(
                                screenWidth * 0.035,
                              ),
                              height: ContainerHeight,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: colorthime,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.085,
                                    child: SvgPicture.asset('img/cancel.svg',
                                        semanticsLabel: 'Agents'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Tickets Canseled",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("$Tickets_canseled_Count",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: amber,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                            },
                            child: Container(
                              margin: EdgeInsets.all(
                                screenWidth * 0.035,
                              ),
                              height: ContainerHeight,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: colorthime,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.085,
                                    child: SvgPicture.asset('img/solution.svg',
                                        semanticsLabel: 'Agents'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Tickets Solved",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("$Tickets_solved_Count",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: amber,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {

                            },
                            child: Container(
                              margin: EdgeInsets.all(
                                screenWidth * 0.035,
                              ),
                              height: ContainerHeight,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: colorthime,

                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.085,
                                    child: SvgPicture.asset('img/cars.svg',
                                        semanticsLabel: 'Agents'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Cars",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("$CarsCount",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: amber,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                            },
                            child: Container(
                              margin: EdgeInsets.all(
                                screenWidth * 0.035,
                              ),
                              height: ContainerHeight,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: colorthime,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.085,
                                    child: SvgPicture.asset('img/numrepiter.svg',
                                        semanticsLabel: 'Agents'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Repeaters",
                                        textAlign: TextAlign.left,
                                        style:TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("$RepeatersCount",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: amber,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {

                            },
                            child: Container(
                              margin: EdgeInsets.all(
                                screenWidth * 0.035,
                              ),
                              height: ContainerHeight,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: colorthime,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.085,
                                    child: SvgPicture.asset('img/work.svg',
                                        semanticsLabel: 'Agents'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Daily Work",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("$dailyWork_Count",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: amber,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth * 0.01,
                )
              ],
            ),
          ),
        ));
  }

  var databody;

  Future<void> getListOfReports() async {
    // var headers = {'Authorization': 'Bearer ${widget.token}'};
    // var request = http.Request('GET',
    //     Uri.parse('https://mgm1.dishtele.com/api/v1/Reports/getListOfReports'));
    //
    // request.headers.addAll(headers);
    //
    // http.StreamedResponse response = await request.send();
    //
    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }

    var headers = {'Authorization': 'Bearer '};
    var request = http.Request('GET',
        Uri.parse('https://mgm1.dishtele.com/api/v1/Reports/getListOfReports'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      databody = jsonDecode(await response.stream.bytesToString());
      setState(() {
        agentCount = "0";
        databody["agentCount"] == null
            ? agentCount = "0"
            : agentCount = "${databody["agentCount"]}";
        databody["dailyWork_Count"] == null
            ? dailyWork_Count = "0"
            : dailyWork_Count = "${databody["dailyWork_Count"]}";

        databody["Tickets_Wating_Count"] == null
            ? Tickets_Wating_Count = "0"
            : Tickets_Wating_Count = "${databody["Tickets_Wating_Count"]}";

        databody["Tickets_solved_Count"] == null
            ? Tickets_solved_Count = "0"
            : Tickets_solved_Count = "${databody["Tickets_solved_Count"]}";

        databody["Tickets_canseled_Count"] == null
            ? Tickets_canseled_Count = "0"
            : Tickets_canseled_Count = "${databody["Tickets_canseled_Count"]}";

        databody["CarsCount"] == null
            ? CarsCount = "0"
            : CarsCount = "${databody["CarsCount"]}";

        databody["RepeatersCount"] == null
            ? RepeatersCount = "0"
            : RepeatersCount = "${databody["RepeatersCount"]}";

        databody["EmployeeCount"] == null
            ? EmployeeCount = "0"
            : EmployeeCount = "${databody["EmployeeCount"]}";
      });
    } else {
      print(response.statusCode);

      if (response.statusCode == 401) {
        //EasyLoading.dismiss();

        save_tokinLogout();
        //EasyLoading.showInfo("قم بتسجيل الدخولً");
/*
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Login()),
                (Route<dynamic> route) => false);*/
      }

      print(response.reasonPhrase);
    }
    //EasyLoading.dismiss();
  }

  Future<void> save_tokinLogout() async {
    /*final SharedPreferences prefs = await _prefs;
    _counter = prefs.setString("token", "0").then((bool success) {
      print("token done");
      return "0";
    });*/
  }
}
