import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  TextEditingController get pass => _pass;
  TextEditingController get phone => _phone;

  void login() async {
    if (_phone.text.isNotEmpty && _pass.text.isNotEmpty) {
      Get.find<RootController>().login(
        pass: _pass.text,
        phone: _phone.text,
      );
    } else {
      Get.snackbar("Fill Fields", "Fill all fields");
    }
  }

  @override
  void onReady() {
    super.onReady();
    checkLogin();
  }

  void checkLogin() {
    UserModel _model = StorageServices().getCredentials();
    if (_model.pass != null && _model.pass!.isNotEmpty) {
      Get.find<RootController>().login(
        pass: _model.pass!,
        phone: _model.phone!,
      );
    }
  }
}
