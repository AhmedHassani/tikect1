import 'package:get/get.dart';
import 'package:ticket1/Style/app_color.dart';


import 'data_controller.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.put(DataController());
    Get.put(ColorController());

  }
}
