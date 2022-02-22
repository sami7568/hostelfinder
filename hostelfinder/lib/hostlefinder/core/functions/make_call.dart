import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

Future<void> makePhoneCall(String url) async {
  url = "tel:$url";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    Get.snackbar("Failed", "Can't make call to this number");
  }
}
