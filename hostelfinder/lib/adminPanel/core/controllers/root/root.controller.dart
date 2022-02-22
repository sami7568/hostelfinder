import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class RootController extends GetxController   {
  late DatabaseReference db;
  final controller = Get.put(SignupController());

  String phoneNumber = '';

  bool isDbIntialize = false;

  Future<bool> dbInitialize() async {
    if (!isDbIntialize) {
      isDbIntialize = false;
      db = await FirebaseServices().firebaseApp();
      isDbIntialize = true;
    }
    return true;
  }

  @override
  void onReady() {
    super.onReady();
    dbInitialize();
  }

  void login({required String pass, required String phone}) async {
    String path = "${FirebaseServices.loginPath}/$phone";
    phoneNumber = phone;
    showloading();
    if (await dbInitialize()) {
      db.child(path).get().then((value) {
        Get.back();
        if (value.exists) {
          if (value.value['password'] == pass) {
            StorageServices().storeCredential(pass: pass, phone: phone);
            Get.offAllNamed(AppRoutes.home);
          } else {
            Get.defaultDialog(
              title: "Wrong password",
              middleText: "Your password isn't correct. try again",
            );
          }
        } else {
          Get.defaultDialog(
            title: "Invalid Details",
            middleText: "Your provided details are not exist.",
          );
        }
      });
    }
  }

  Future signup({required String pass, required String phone}) async {
    String path = "${FirebaseServices.loginPath}/$phone";
    if (await dbInitialize()) {
      showloading();
      db.child(path).get().then((value) {
        Get.back();
        if (value.exists) {
          Get.defaultDialog(
            title: "Number exists",
            middleText: "User already exists with your provided phone number.",
          );
        } else {
          db.child(path).set({"password": pass}).then((value) {
            login(phone : '${controller.phone.text}', pass: '${controller.pass.text}' );

            // Get.defaultDialog(
            //   title: "Signup successful",
            //   middleText:
            //       "Your account is successfully created. now you can login to your account",
            // );
          });
        }
      });
    }
  }
}
