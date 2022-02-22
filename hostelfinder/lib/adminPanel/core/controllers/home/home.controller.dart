import 'dart:math';
import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController _city = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _hostelName = TextEditingController();
  final TextEditingController _ownerName = TextEditingController();
  final TextEditingController _seatsavilable = TextEditingController();
  final TextEditingController _seatrent = TextEditingController();
  final TextEditingController _facilities = TextEditingController();
  final TextEditingController _bedsperroom = TextEditingController();
  String location = "";

  TextEditingController get city => _city;
  TextEditingController get contact => _contact;
  TextEditingController get ownerName => _ownerName;
  TextEditingController get hostelName => _hostelName;
  TextEditingController get seatavilable => _seatsavilable;
  TextEditingController get seatrent => _seatrent;
  TextEditingController get facilities => _facilities;
  TextEditingController get bedsperroom => _bedsperroom;

  @override
  void onReady() {
    super.onReady();
    fetchHostels();
  }

  // Controll Buttons According to User Data
  RxBool isRequsted = false.obs;

  // Curd Operations Start
  Future updateData() async {
    if (_city.text.isNotEmpty &&
        _contact.text.isNotEmpty &&
        _ownerName.text.isNotEmpty &&
        _hostelName.text.isNotEmpty &&
        _seatrent.text.isNotEmpty &&
        _seatsavilable.text.isNotEmpty &&
        _bedsperroom.text.isNotEmpty
        &&
        _facilities.text.isNotEmpty) {
      showloading();
      //Created Object of RootController
      var con = Get.find<RootController>();

      // Making path
      String path = "${FirebaseServices.detailsPath}/${updateModel.value.tag}";

      try {
        Position position = await getPositions();
        location = "${position.latitude},${position.longitude}";
        // Sending Request to Database for Data
        con.db.child(path).update(
          {
            "city": _city.text,
            "contact": _contact.text,
            "owner_name": _ownerName.text,
            "hostel_name": _hostelName.text,
            "seat_rent": _seatrent.text,
            "avilable_seats": _seatsavilable.text,
            "facilities": _facilities.text,
            "bedsperroom": _bedsperroom.text,
            "directions": location,
          },
        ).then((value) {
          Get.back();
          Get.snackbar("Updated", "Hostel record successfully updated.");
          fetchHostels();
        });
      } catch (e) {
        Get.back();
        Get.snackbar(
          "Error",
          "Please allow location permission",
          backgroundColor: AppColors.main,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar("Fill Fields", "Fill all fields");
    }
  }

  // Delete Hostel
  void deleteData(String tag) async {
    showloading();
    //Created Object of RootController
    var con = Get.find<RootController>();

    // Making path
    String path = "${FirebaseServices.detailsPath}/$tag";
    String hostelID = "${FirebaseServices.hostelsPath}/${con.phoneNumber}/$tag";

    // Sending Request to Database for Data
    con.db.child(path).remove().then((value) {
      con.db.child(hostelID).remove().then((value) {
        Get.back();
        Get.snackbar("Deleted", "Hostel record deleted successfully");
        fetchHostels();
      });
    });
  }

  // Clear Test Controllers
  void clear() {
    location = "";
    _city.clear();
    _contact.clear();
    _ownerName.clear();
    _hostelName.clear();
    _seatsavilable.clear();
    _seatrent.clear();
    _facilities.clear();
    _bedsperroom.clear();
  }

  // Add New Hostel
  Future addData() async {
    if (_city.text.isNotEmpty &&
        _contact.text.isNotEmpty &&
        _ownerName.text.isNotEmpty &&
        _hostelName.text.isNotEmpty &&
        _seatrent.text.isNotEmpty &&
        _seatsavilable.text.isNotEmpty &&
        _bedsperroom.text.isNotEmpty
        &&
        _facilities.text.isNotEmpty) {
      showloading();
      //Created Object of RootController
      var con = Get.find<RootController>();

      // Creating Random Path
      int _ranID = Random().nextInt(10000000);
      String randomID = "${con.phoneNumber}_$_ranID";

      // Making path
      String path = "${FirebaseServices.detailsPath}/$randomID";

      try {
        Position position = await getPositions();
        location = "${position.latitude},${position.longitude}";

        // Sending Request to Database for Data
        con.db.child(path).set(
          {
            "city": _city.text,
            "contact": _contact.text,
            "owner_name": _ownerName.text,
            "hostel_name": _hostelName.text,
            "seat_rent": _seatrent.text,
            "avilable_seats": _seatsavilable.text,
            "facilities": _facilities.text,
            "bedsperroom": _bedsperroom.text,
            "directions": location,
          },
        ).then((value) {
          Map<dynamic, dynamic> _map = {randomID: randomID};
          // ignore: prefer_typing_uninitialized_variables
          late var values;
          if (snapshot != null) {
            values = snapshot!.value;
            values.addAll(_map);
          } else {
            values = _map;
          }

          con.db
              .child(FirebaseServices.hostelsPath)
              .child(con.phoneNumber)
              .set(values)
              .then((value) {
            Get.back();
            Get.snackbar(
              "Added",
              "Hostel successfully added.",
              backgroundColor: AppColors.main,
              colorText: AppColors.white,
              snackPosition: SnackPosition.BOTTOM,
            );
            clear();
            fetchHostels();
          });
        });
      } catch (e) {
        Get.back();
        Get.snackbar(
          "Error",
          "Please allow location permission",
          backgroundColor: AppColors.main,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar("Fill Fields", "Fill all fields");
    }
  }

  // Fetch Hostels Record
  RxList<FirebaseDataModel> record = <FirebaseDataModel>[].obs;
  void fetchHostels() async {
    isRequsted.value = false;
    //Created Object of RootController
    var con = Get.find<RootController>();
    // Making path
    String path = "${FirebaseServices.hostelsPath}/${con.phoneNumber}";
    // Fetch Hostels ID
    record.clear();
    con.db.child(path).get().then((value) {
      isRequsted.value = true;
      if (value.exists) {
        snapshot = value;
        value.value.entries.forEach((element) {
          String hostelPath = "${FirebaseServices.detailsPath}/${element.key}";
          con.db.child(hostelPath).get().then((value) {
            if (value.exists) {
              record.add(FirebaseDataModel.processor(value));
            }
          });
        });
      }
    });
  }

  DataSnapshot? snapshot;

  // Update Hostel Model
  Rx<FirebaseDataModel> updateModel = FirebaseDataModel().obs;
  void setUpdateValues() {
    _city.text = updateModel.value.city!;
    location = updateModel.value.directions!;
    _contact.text = updateModel.value.contact!;
    _ownerName.text = updateModel.value.ownername!;
    _hostelName.text = updateModel.value.hostelname!;
    _seatsavilable.text = updateModel.value.seatavilable!;
    _seatrent.text = updateModel.value.seatrent!;
    _facilities.text= updateModel.value.facilities!;
    _bedsperroom.text=updateModel.value.bedsperroom!;
  }
}
