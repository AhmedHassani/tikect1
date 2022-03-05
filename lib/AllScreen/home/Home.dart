import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ticket1/AllScreen/dashboard/dashboard.dart';
import 'Home2.dart';

class Home extends StatefulWidget {
  final String token;
  final String user_id;
  final String full_name;
  final String img;
  Home(this.token, this.user_id, this.full_name, this.img);
  Homestate createState() => Homestate();
}

class Homestate extends State<Home> {
  List<Widget> _screens = [Home2(),Dashboard()];
  String? tokenx = "";
  String agentCount = "0";
  String dailyWork_Count = "0";
  String Tickets_Wating_Count = "0";
  String Tickets_solved_Count = "0";
  String Tickets_canseled_Count = "0";
  String CarsCount = "0";
  String RepeatersCount = "0";
  String EmployeeCount = "0";

  String imgx = "https://www.bootdey.com/img/Content/avatar/avatar7.png";

  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    getListOfReports();
  }

  String name = "Dashboard";
  int page = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late Future<String> _counter;
  var colorthime = Color(int.parse("0xff131630"));
  var amber = Colors.amber[800];
  var colorthime2 = Color(int.parse("0xff181c3c"));
  var white = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //     extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,

        title: Text("$name",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              color: amber,
              fontWeight: FontWeight.bold,
            )),
        foregroundColor: colorthime,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Image.asset(
              'assets/images/menu.png',
              width: 20,
              height: 20,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        backgroundColor: colorthime,
        elevation: 0,
      ),
      drawer: Drawer(
          child: Container(
        color: colorthime,
        child: Column(
          //   padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorthime2,
              ),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: colorthime,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Container(
                          height: 88,
                          width: 88,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.img != "null"
                                  ? "https://mgm1.dishtele.com/${widget.img}"
                                  : "https://www.bootdey.com/img/Content/avatar/avatar7.png"),
                              fit: BoxFit.cover,
                            ),
                            color: colorthime,
                            borderRadius: BorderRadius.circular(99),
                          )),
                    ),
                    Text(
                      "${widget.full_name}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        color: amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.home,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "DashBoard",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 1,
                        color: white.withOpacity(0.25),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              /*
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          PartTicktet(widget.token)),
                                  (Route<dynamic> route) => true);

                               */
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.ticketAlt,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Part Ticket",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              /*
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyTicktet(widget.token)),
                                  (Route<dynamic> route) => true);

                               */
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.tags,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "My Tickets",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),

                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              /*
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          StatusTicktet(widget.token, "0")),
                                  (Route<dynamic> route) => true);

                               */
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    /*
                                    FaIcon(FontAwesomeIcons.userFriends,
                                        size: 17, color: amber),

                                     */
                                    //    IconDataSolid(0xf641),

                                    SizedBox(
                                      width: 25,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(
                                        "Tickets Waiting",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "$Tickets_Wating_Count",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: amber,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),

                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              /*
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          StatusTicktet(widget.token, "2")),
                                  (Route<dynamic> route) => true);

                               */
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FaIcon(FontAwesomeIcons.userFriends,
                                        size: 17, color: amber),
                                    //    IconDataSolid(0xf641),

                                    SizedBox(
                                      width: 25,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(
                                        "Tickets Canseled",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "$Tickets_canseled_Count",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: amber,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              /*
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          StatusTicktet(widget.token, "1")),
                                  (Route<dynamic> route) => true);

                               */
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FaIcon(FontAwesomeIcons.userFriends,
                                        size: 17, color:amber),
                                    //    IconDataSolid(0xf641),

                                    SizedBox(
                                      width: 25,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(
                                        "Tickets Solved",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "$Tickets_solved_Count",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: amber,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: white.withOpacity(0.25),
                      ),
                      //agent
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              /*
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AgentsCard(widget.token)),
                                  (Route<dynamic> route) => true);

                               */
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FaIcon(FontAwesomeIcons.userFriends,
                                        size: 17, color: amber),
                                    //    IconDataSolid(0xf641),

                                    SizedBox(
                                      width: 25,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(
                                        "Agent",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "$agentCount",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: amber,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                       /*       Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AddAgents(widget.token)),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.addressCard,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Add Agent",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),

                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                           /*   Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AgentsFiber(widget.token)),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.userAlt,
                                  size: 17,
                                  color: amber,
                                ),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Fiber Agent",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              /*Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AgentBand(widget.token)),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.userCog,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Band Agent",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                             /* Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AgentsOff(widget.token)),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.userTimes,
                                    size: 17, color: amber),
                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Agent Off",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: white.withOpacity(0.25),
                      ),
                      //work
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              /*
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyWork(widget.token)),
                                  (Route<dynamic> route) => true);

                               */
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                /*
                                FaIcon(FontAwesomeIcons.hardHat,
                                    size: 17, color: Mycolor().amber),
                                //    IconDataSolid(0xf641),

                                 */
                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "My Work",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),

                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                            /*  Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          WorkDay(widget.token, "0")),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.hardHat,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Work ToDay",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                              /*Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          WorkSchedule(widget.token, "0")),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FaIcon(FontAwesomeIcons.database,
                                        size: 17, color: amber),
                                    //    IconDataSolid(0xf641),

                                    SizedBox(
                                      width: 25,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(
                                        "Work Schedule",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "$dailyWork_Count",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: amber,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                          /*    Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          WorkSchedule(widget.token, "1")),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(FontAwesomeIcons.tools,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Work Fiber",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color:white.withOpacity(0.25),
                      ),

                      // chat
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                             /* Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Loadcaht(
                                              widget.token, widget.user_id)),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.rocketchat,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Chat",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      // Container(
                      //   margin: EdgeInsets.all(5),
                      //   child: InkWell(
                      //       onTap: () {
                      //         Navigator.of(context).pushAndRemoveUntil(
                      //             MaterialPageRoute(
                      //                 builder: (BuildContext context) =>
                      //                     AgentsCard(widget.token)),
                      //             (Route<dynamic> route) => true);
                      //       },
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           FaIcon(FontAwesomeIcons.networkWired,
                      //               size: 17, color: Mycolor().amber),
                      //           //    IconDataSolid(0xf641),
                      //
                      //           SizedBox(
                      //             width: 25,
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.all(3),
                      //             child: Text(
                      //               "Cisco",
                      //               textAlign: TextAlign.left,
                      //               style: GoogleFonts.cairo(
                      //                 fontSize: 18,
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w500,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       )),
                      // ),
                      //
                      // Container(
                      //   margin: EdgeInsets.all(5),
                      //   child: InkWell(
                      //       onTap: () {
                      //         Navigator.of(context).pushAndRemoveUntil(
                      //             MaterialPageRoute(
                      //                 builder: (BuildContext context) =>
                      //                     AgentsCard(widget.token)),
                      //             (Route<dynamic> route) => true);
                      //       },
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           FaIcon(FontAwesomeIcons.networkWired,
                      //               size: 17, color: Mycolor().amber),
                      //           //    IconDataSolid(0xf641),
                      //
                      //           SizedBox(
                      //             width: 25,
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.all(3),
                      //             child: Text(
                      //               "Servers",
                      //               textAlign: TextAlign.left,
                      //               style: GoogleFonts.cairo(
                      //                 fontSize: 18,
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w500,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       )),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.all(5),
                      //   child: InkWell(
                      //       onTap: () {
                      //         Navigator.of(context).pushAndRemoveUntil(
                      //             MaterialPageRoute(
                      //                 builder: (BuildContext context) =>
                      //                     AgentsCard(widget.token)),
                      //             (Route<dynamic> route) => true);
                      //       },
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           FaIcon(FontAwesomeIcons.battleNet,
                      //               size: 17, color: Mycolor().amber),
                      //           //    IconDataSolid(0xf641),
                      //
                      //           SizedBox(
                      //             width: 25,
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.all(3),
                      //             child: Text(
                      //               "Attachments",
                      //               textAlign: TextAlign.left,
                      //               style: GoogleFonts.cairo(
                      //                 fontSize: 18,
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w500,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       )),
                      // ),

                      Container(
                        height: 1,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: white.withOpacity(0.25),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                           /*   Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Repeaters(widget.token)),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // FaIcon(FontAwesomeIcons.solidHdd,
                                    //     size: 17, color: amber),
                                    // //    IconDataSolid(0xf641),

                                    SizedBox(
                                      width: 25,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(
                                        "Repeaters",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "$RepeatersCount",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: amber,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),

                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                           /*   Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EmployeesPhone(widget.token)),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.teamspeak,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Team Phones",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),

                      Container(
                        margin: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {
                             /* Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyAccount(widget.token)),
                                  (Route<dynamic> route) => true);*/
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.houseUser,
                                    size: 17, color: amber),
                                //    IconDataSolid(0xf641),

                                SizedBox(
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "My Account",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Container(
                      height: 2,
                      color: colorthime2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: InkWell(
                          onTap: () {
                            navigateToLogout();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FaIcon(FontAwesomeIcons.signOutAlt,
                                  size: 17, color: amber),
                              SizedBox(
                                width: 25,
                              ),
                              Padding(
                                padding: EdgeInsets.all(3),
                                child: Text(
                                  "Logout",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
      body: Container(
        color: colorthime,
        child: PageView(
          scrollDirection: Axis.horizontal,
          pageSnapping: false,
          controller: pageController,
          children: _screens,
          physics: NeverScrollableScrollPhysics(),
          //   onPageChanged:_onpagechanged ,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 11,

        type: BottomNavigationBarType.fixed, // This is all you need!
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: white,
        backgroundColor: colorthime2,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "",
          ),
        ],
        currentIndex: page,
        selectedItemColor: amber,
        onTap: onItemTappedx,
      ),
    );
  }

  void onItemTapped(int selectedIndxe) {
    //   pageController.animateToPage(selectedIndxe, duration: Duration(milliseconds: 300), curve: Curves.easeIn);

    pageController.jumpToPage(selectedIndxe);
    print(selectedIndxe);
  }
  void onItemTappedx(int index) {
    setState(() {
      if (index == 0) {
        name = "Dashboard";
      } else if (index == 1) {
        name = "My Work";
      } else if (index == 2) {
        name = "My Ticktet";
      } else if (index == 3) {
        name = "My Account";
      }

      page = index;
    });
    onItemTapped(page);
  }

  Future<void> save_tokinLogout() async {
  /*  final SharedPreferences prefs = await _prefs;
    _counter = prefs.setString("token", "0").then((bool success) {
      print("token done");
      return "0";
    });*/
  }

  void navigateToLogout() async {
    var headers = {'Authorization': 'Bearer ${widget.token}'};
    var request = http.Request(
        'GET', Uri.parse('https://mgm1.dishtele.com/api/v1/users/logout'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    save_tokinLogout();
  /*  Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => Login()),
        (Route<dynamic> route) => false);*/
  }

  List<dynamic> user_inf = [];

  var databody;

  Future<void> getListOfReports() async {
    var headers = {'Authorization': 'Bearer ${widget.token}'};
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
       // EasyLoading.showInfo("قم بتسجيل الدخولً");
        /*
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Login()),
            (Route<dynamic> route) => false);

         */
      }

      print(response.reasonPhrase);
    }

  }
}
