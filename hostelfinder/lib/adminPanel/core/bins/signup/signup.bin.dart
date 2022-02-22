import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
