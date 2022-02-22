import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RootController(), permanent: true);
  }
}
