import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  TextEditingController get pass => _pass;
  TextEditingController get phone => _phone;

  void signup() async {
    if (_phone.text.isNotEmpty && _pass.text.isNotEmpty) {
      Get.find<RootController>().signup(
        pass: _pass.text,
        phone: _phone.text,
      );
    } else {
      Get.snackbar("Fill Fields", "Fill all fields");
    }
  }
}
