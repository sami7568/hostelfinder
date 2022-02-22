import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';

class StorageServices {
  static const String phoneKey = "phone";
  static const String passKey = "pass";

  UserModel getCredentials() {
    return UserModel(
      phone: GetStorage().read(phoneKey) ?? "",
      pass: GetStorage().read(passKey) ?? "",
    );
  }

  void storeCredential({required String pass, required String phone}) async {
    await GetStorage().write(phoneKey, phone);
    await GetStorage().write(passKey, pass);
  }

  Future<void> logout() async {
    await GetStorage().remove(passKey);
    await GetStorage().remove(phoneKey);
  }
}
