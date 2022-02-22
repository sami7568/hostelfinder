import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/firebase/firebase.dart';

class RootController extends GetxController   {
  late DatabaseReference db;
  late DatabaseReference hosteldb;
  //final controller = Get.put(SignupController());

  String phoneNumber = '';

  bool isDbIntialize = false;

  Future<bool> dbInitialize() async {
    if (!isDbIntialize) {
      isDbIntialize = false;
      db = await FirebaseServices().firebaseApp();
      hosteldb = await FirebaseServices().HostelFirebaseApp();
      isDbIntialize = true;
    }
    return true;
  }

  @override
  void onReady() {
    super.onReady();
    dbInitialize();
  }


  // Future signup({required String pass, required String phone}) async {
  //   String path = "${FirebaseServices.loginPath}/$phone";
  //   if (await dbInitialize()) {
  //     showloading();
  //     db.child(path).get().then((value) {
  //       Get.back();
  //       if (value.exists) {
  //         Get.defaultDialog(
  //           title: "Number exists",
  //           middleText: "User already exists with your provided phone number.",
  //         );
  //       } else {
  //         db.child(path).set({"password": pass}).then((value) {
  //         //  login(phone : '${controller.phone.text}', pass: '${controller.pass.text}' );
  //
  //           // Get.defaultDialog(
  //           //   title: "Signup successful",
  //           //   middleText:
  //           //       "Your account is successfully created. now you can login to your account",
  //           // );
  //         });
  //       }
  //     });
  //   }
  // }
}
