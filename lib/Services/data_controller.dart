import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ticket1/Model/model_http.dart';

class DataController extends GetxController {
  String myUrl = "http://192.168.224.190:81";

  @override
  void onInit() {
    super.onInit();
  }

  final box = GetStorage();
  String token = '';



  int error = 0;
  Future<void> readToken() async {
    token = box.read("token").toString();
    update();
  }

  Future<void> changeToken(
    String tokenNew,
  ) async {
    token = tokenNew;
    box.write("token", token);
    update();
  }


}
