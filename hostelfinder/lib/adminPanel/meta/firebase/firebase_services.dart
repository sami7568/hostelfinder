import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';

class FirebaseServices {
  // Project Token
  String? token = "https://hostel-finder-10365-default-rtdb.firebaseio.com/";

  // User Details Bucket
  static const String detailsPath = "/Users";
  static const String loginPath = "/login";
  static const String hostelsPath = "/hostel_list";

  // FirebaseData Referrence
  Future<DatabaseReference> firebaseApp() async {
    late DatabaseReference app;
    try {
      app = FirebaseDatabase(app: Firebase.app()).reference();
      await app.child(loginPath).get().then((value) => value);
    } catch (e) {
      app = FirebaseDatabase(databaseURL: token).reference();
      await app.child(loginPath).get().then((value) => value);
    }
    return app;
  }
}
