import 'dart:math';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';
 import 'package:permission_handler/permission_handler.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/core/controller/root/root.controller.dart';
import 'package:hostelfinder/hostlefinder/view/home/widget/MapUiPage.dart';
import 'package:hostelfinder/hostlefinder/view/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late DatabaseReference db;
  late DatabaseReference dbRating;

  bool isDbIntialize = false;

  RxList<FirebaseDataModel> originalRecords = <FirebaseDataModel>[].obs;
  RxList<FirebaseDataModel> records = <FirebaseDataModel>[].obs;

  RxList<RatingDataModel> ratingRecords = <RatingDataModel>[].obs;
  //RxList<FirebaseDataModel> records = <FirebaseDataModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    isDbIntialize = false;
    db = await FirebaseServices().firebaseApp();
    dbRating = await FirebaseServices().firebaseAppRating();

    isDbIntialize = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // List<String> musicsString = (await prefs.getStringList('rating'))!;
    // List<Music> musics = Music.decode(musicsString.last);
    // print(musics.map((e) => e.rating));
    // print(musics.map((e) => e.id));
  }
  List<LocationModel> lopcaitonModel = <LocationModel>[];
  //List<RatingDataModel> ratingData = <RatingDataModel>[];
  Future<DataSnapshot> future() async {
    if (!isDbIntialize) {
      db = await FirebaseServices().firebaseApp();
    }
    data = await db.get();
    if (data.exists) {
      List<FirebaseDataModel> _list = FirebaseDataModel().getList(data);
     originalRecords.addAll(_list);
      print("count is ${_list.length}");
      records.addAll(_list);

      print(_list.map((e) => e.bedsperroom!).toList());
      print(_list.map((e) => e.tag));
      records.forEach((element) {

        print(element.city);
        print(element.seatavilable);
        print(element.seatrent);
        print(element.bedsperroom);
        print(element.contact);
        print(element.facilities);
        print(element.directions);
        print(element.tag);
        print(element.hostelname);
        print(element.ownername);

        lopcaitonModel.add(LocationModel(ownerNAme: element.ownername!,contact: element.contact!,
            city: element.city!,longitude:  double.parse( element.directions!.split(',').first) ,
            latitude: double.parse( element.directions!.split(',').last,),facilities: element.facilities!,
          seatavilable: element.seatavilable!, tag: element.tag!, seatrent: element.seatrent!, hostelname: element.hostelname!,
          bedsperroom: element.bedsperroom!,));
      });

      // ratingData.forEach((element) {
      //   print("complete ratring detail");
      //   print(element.rating);
      //   print(element.tag);
      // });

      App.LocaitonModel = lopcaitonModel;
    }

    return data;
  }

  late DataSnapshot data;

  // Search Hostel Functionality Start from Here
  TextEditingController searchController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    searchController.addListener(searchListener);
  }

  void searchListener() {
    if (searchController.text.isNotEmpty) {
      List<FirebaseDataModel> _models = [];
      for (var element in originalRecords) {
        if (isItemAvailable(element)) {
          _models.add(element);
        }
      }
      records.assignAll(_models);
    } else {
      records.assignAll(originalRecords);
    }
  }

  bool isItemAvailable(FirebaseDataModel model) {
    String text = searchController.text.toLowerCase();
    if (model.contact!.toLowerCase().contains(text)) {
      return true;
    } else if (model.city!.toLowerCase().contains(text)) {
      return true;
    } else if (model.hostelname!.toLowerCase().contains(text)) {
      return true;
    } else if (model.ownername!.toLowerCase().contains(text)) {
      return true;
    } else {
      return false;
    }
  }
  Future<Position> getPositions() async {
    LocationPermission permission;
    await Permission.location.request();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
  RxBool isRequsted = false.obs;
  double rate = 1.0;
  Future<String> fetchHostels(String tags) async {
    DataSnapshot? snapshot;

    isRequsted.value = false;
    //Created Object of RootController
    var con = Get.find<HomeController>();
    // Making path
   // tagsList.forEach((element) {

      String path = "${FirebaseServices.ratingPath}/${tags}";
      // Fetch Hostels ID
      // record.clear();
    String ratingValue = "";

    con.dbRating.child(path).get().then((value) {
        isRequsted.value = true;
        if (value.exists) {
          snapshot = value;
          value.value.entries.forEach((element) {
            String hostelPath = "${FirebaseServices.ratingPath}/${element.key}";
            con.dbRating.child(hostelPath).get().then((value) {
              print(value.value);

              if (value.exists) {
                print("Rating is ${RatingDataModel.processor(value).tag}");
                print("Rating is ${RatingDataModel.processor(value).rating}");
                ratingRecords.add(RatingDataModel.processor(value));
                ratingValue = RatingDataModel.processor(value).rating!;
                print("Value is $rate");
                print(ratingValue.isEmpty ? "1.0" : double.parse(ratingValue));
                rate = double.parse(ratingValue);
              }
            });
          });
        }
      });
  //  });


    if (ratingValue.isEmpty) {
      rate = 1.0;
    } else {
      rate = double.parse(ratingValue);
    }
   return ratingValue.isEmpty ? "1.0" :ratingValue;
  }
  Future addRatingData(String tag,String value,BuildContext context) async {
    print(":helllo");
    DataSnapshot? snapshot;

    // controller.rating.text = "4";
    //_rating.text = "2";
    //print(_rating.text);
    if ("${tag}_1828587".isNotEmpty &&
        value.isNotEmpty) {
      showloading();
      print("23");
      //Created Object of RootController
      var con = Get.find<HomeController>();

      // Creating Random Path
      int _ranID = Random().nextInt(10000000);
      String randomID = "${tag}${_ranID}";

      // Making path
      String path = "${FirebaseServices.ratingPath}/$randomID";

      try {
        Position position = await getPositions();
        var location = "${position.latitude},${position.longitude}";

        // Sending Request to Database for Data
        con.dbRating.child(path).set(
          {
            "tag": "${tag}",
            "rating": "$value",
          },
        ).then((value) {
          Map<dynamic, dynamic> _map = {randomID: randomID};
          // ignore: prefer_typing_uninitialized_variables
          late var values;
          if (snapshot != null) {
            values = snapshot.value;
           // values.addAll(_map);
          } else {
            values = _map;
          }

          con.dbRating
              .child(FirebaseServices.ratingPath)
              .child(tag)
              .set(values)
              .then((value) {
            Get.back();
            print("sucess");
            Get.snackbar(
              "Added",
              "Rating successfully added.",
              backgroundColor: AppColors.main,
              colorText: AppColors.white,
              snackPosition: SnackPosition.BOTTOM,
            );
           // Navigator.pop(context);
           // clear();
            getRating();
          //  fetchHostels();
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
      print("Fill Fields");
      Get.snackbar("Fill Fields", "Fill all fields");
    }
  }
  Future addData() async {
    DataSnapshot? snapshot;

    print(":helllo");
    // controller.rating.text = "4";
    //_rating.text = "2";
    print("_rating.text");
    if ("0345242656336_1828587".isNotEmpty &&
        "5.0".isNotEmpty) {
      showloading();
      print("23");
      //Created Object of RootController
      //var con = Get.find<RootController>();
      var con =  Get.put(HomeController());

      // Creating Random Path
      int _ranID = Random().nextInt(10000000);
      String randomID = "${"abc"}_$_ranID";

      // Making path
      String path = "${FirebaseServices.ratingPath}/$randomID";

      try {
         Position position = await getPositions();
        var location = "${position.latitude},${position.longitude}";
        // Sending Request to Database for Data
        con.dbRating.child(path).set(
          {
            "tag": "0345242656336_1828587",
            "rating": "5.0",
          },
        ).then((value) {
          Map<dynamic, dynamic> _map = {randomID: randomID};
          // ignore: prefer_typing_uninitialized_variables
          late var values;
          if (snapshot != null) {
            values = snapshot.value;
            values.addAll(_map);
          } else {
            values = _map;
          }

          con.dbRating
              .child(FirebaseServices.ratingPath)
              .child('03452426563')
              .set(values)
              .then((value) {
            Get.back();
            Get.snackbar(
              "Added",
              "Rating successfully added.",
              backgroundColor: AppColors.main,
              colorText: AppColors.white,
              snackPosition: SnackPosition.BOTTOM,
            );
            // clear();
            getRating();
            // fetchHostels();
          });
        });
      }
      catch (e) {
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
      print("Fill Fields");
      Get.snackbar("Fill Fields", "Fill all fields");
    }
  }
  Future<DataSnapshot> getRating() async {
    if (!isDbIntialize) {
      dbRating = await FirebaseServices().firebaseAppRating();
    }
    data = await dbRating.get();
    if (data.exists) {
      List<RatingDataModel> _listq = RatingDataModel().getList(data);

      print(_listq.map((element) => e));
      print("rting is ${_listq.length}");
     // print("rting is ${_listq.map((e) => e.rating.obs)}");
      print("rting is ${_listq.map((e) => e.tag).map((e) => e)}");
     // print("rting is ${_listq.map((e) => e.rating)}");
      ratingRecords.addAll(_listq);
      // print("count is ${_list.length}");
      // records.addAll(_list);
     print("rting is ${ratingRecords.map((e) => e.tag)}");

     // print(_list.map((e) => e.tag));
      ratingRecords.forEach((element) {

        print(element.tag);
        print(element.rating);

        //   lopcaitonModel.add(LocationModel(name: element.!,ownerNAme: element.ownername!,contact: element.contact!, city: element.city!,longitude:  double.parse( element.directions!.split(',').first) , latitide: double.parse( element.directions!.split(',').last)));
      });
     //  App.LocaitonModel = lopcaitonModel;
    }

    return data;
  }
  Future<String?> futureRating() async {
    if (!isDbIntialize) {
      db = await FirebaseServices().firebaseAppRating();
    }
    data = await db.get();
    if (data.exists) {
      List<RatingDataModel> _list = RatingDataModel().getList(data);
      ratingRecords.addAll(_list);
      print("count is ${_list.length}");
      ratingRecords.addAll(_list);
   //   print("count is ${ratingRecords.map((element) => e.ra)}");
     // print("count is ${ratingRecords.tag}");
      print("count is ${_list.map((e) => e.tag)}");
      print("count is ${_list.map((e) => e.rating)}");
      print("count is ${ratingRecords.map((element) => element.tag)}");
      print("count is ${ratingRecords.map((element) => element.rating)}");
      print(_list.map((e) => e.tag));
      ratingRecords.forEach((element) {
        print("count is ${element.rating}");
        print("count is ${element.tag}");

        /// lopcaitonModel.add(LocationModel(name: element.hostelname!,ownerNAme: element.ownername!,contact: element.contact!, city: element.city!,longitude:  double.parse( element.directions!.split(',').first) , latitide: double.parse( element.directions!.split(',').last)));
      });
     // App.LocaitonModel = lopcaitonModel;
    }

    return ratingRecords.map((element) => element.rating).last;
  }
  String location = "";
  Future updateData(FirebaseDataModel model,List<String> rating) async {
    print(model.bedsperroom);
    if (model.city!.isNotEmpty &&
        model.contact!.isNotEmpty &&
        model.ownername!.isNotEmpty &&
        model.hostelname!.isNotEmpty &&
        model.seatrent!.isNotEmpty &&
        model.seatavilable!.isNotEmpty &&
        model.bedsperroom!.isNotEmpty &&
        model.facilities!.isNotEmpty ) {
      showloading();
      //Created Object of RootController
      var con = Get.put(RootController());

      // Making path
      print("${FirebaseServices.detailsPath}/${updateModel.value.tag}");
      String path = "${FirebaseServices.detailsPath}/${updateModel.value.tag}";
      print("${FirebaseServices.detailsPath}/${updateModel.value.tag}");

      try {
        Position position = await getPositions();
         location = "${position.latitude},${position.longitude}";
        // Sending Request to Database for Data
        con.hosteldb.child(path).update(
          {
            "city": model.city,
            "contact": model.contact,
            "owner_name": model.ownername,
            "hostel_name": model.hostelname,
            "seat_rent": model.seatrent,
            "avilable_seats": model,
            "facilities": model.facilities,
            "bedsperroom":model.bedsperroom,
            "directions": model.directions,
            //"rating": model.rating,
          },
        ).then((value) {
          Get.back();
          Get.snackbar("Updated", "Hostel record successfully updated.");
         // fetchHostels();
          future();
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
}
DataSnapshot? snapshot;
Rx<FirebaseDataModel> updateModel = FirebaseDataModel().obs;
// Update Hostel Model
