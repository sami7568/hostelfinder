import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

class FirebaseServices {
  // Project Token
  String? token = "https://hostel-finder-10365-default-rtdb.firebaseio.com/";

  // User Details Bucket
  static const String detailsPath = "/Users";
  static const String ratingPath = "/Rating";
  static const String hostelPath = "/hostel_list";

  // FirebaseData Referrence
  Future<DatabaseReference> firebaseApp() async {
    late DatabaseReference app;
    try {
      app = FirebaseDatabase(app: Firebase.app()).reference();
      await app.child(detailsPath).get().then((value) => value);
    } catch (e) {
      app = FirebaseDatabase(databaseURL: token).reference();
      await app.child(detailsPath).get().then((value) => value);
    }
    return app.child(detailsPath);
  }
  Future<DatabaseReference> HostelFirebaseApp() async {
    late DatabaseReference app;
    try {
      app = FirebaseDatabase(app: Firebase.app()).reference();
      await app.child(hostelPath).get().then((value) => value);
    } catch (e) {
      app = FirebaseDatabase(databaseURL: token).reference();
      await app.child(hostelPath).get().then((value) => value);
    }
    return app.child(hostelPath);
  }
  Future<DatabaseReference> firebaseAppRating() async {
    late DatabaseReference app;
    try {
      app = FirebaseDatabase(app: Firebase.app()).reference();
      await app.child(ratingPath).get().then((value) => value);
    } catch (e) {
      app = FirebaseDatabase(databaseURL: token).reference();
      await app.child(ratingPath).get().then((value) => value);
    }
    return app.child(ratingPath);
  }
}
