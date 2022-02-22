import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

void showloading() {
  Size size = Get.size;
  Get.dialog(
    Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          elevation: 2.0,
          color: Colors.white,
          shape: const CircleBorder(),
          shadowColor: Colors.grey.shade100,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(size.height * 0.03),
            child: CircularProgressIndicator.adaptive(
              strokeWidth: size.width * 0.0075,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.lightBlue),
            ),
          ),
        ),
      ],
    ),
    barrierDismissible: false,
    barrierColor: Colors.grey.withOpacity(0.35),
  );
}
