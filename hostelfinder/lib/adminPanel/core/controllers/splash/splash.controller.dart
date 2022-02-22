import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    AppTheme.splash();
  }

  @override
  void onReady() {
    super.onReady();
    Get.find<RootController>().dbInitialize();
  }

  @override
  void onClose() {
    AppTheme.home();
    super.onClose();
  }

  void movePage() {
    Future.delayed(const Duration(milliseconds: 2250), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
