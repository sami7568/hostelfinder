import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    AppTheme.splash();
  }

  void movePage() {
    Future.delayed(const Duration(milliseconds: 2250), () {
      Get.offAllNamed(AppRoutes.home);
    });
  }

  @override
  void onClose() {
    AppTheme.home();
    super.onClose();
  }
}
