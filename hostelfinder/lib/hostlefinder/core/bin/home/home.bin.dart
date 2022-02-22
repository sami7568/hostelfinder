import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/core/controller/home/home.controller.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
