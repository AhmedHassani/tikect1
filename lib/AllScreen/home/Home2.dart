import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home2 extends StatefulWidget {
  Homestate2 createState() => Homestate2();
}

class Homestate2 extends State<Home2> {
  @override
  void initState() {
    super.initState();
  }
  var colorthime = Color(int.parse("0xff131630"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        color: colorthime,
      ),
    );
  }
}
