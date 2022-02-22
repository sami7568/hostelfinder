// ignore: file_names
// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:hostelfinder/hostlefinder/core/controller/home/home.controller.dart';
import 'package:hostelfinder/hostlefinder/meta/routes/routes.meta.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hostelfinder/hostlefinder/view/home/widget/single_hostle_card.dart';
import 'package:hostelfinder/select.dart';

//import 'dart:math' show sin, cos, sqrt, atan2,asin;
import 'package:vector_math/vector_math.dart' as radians;
//import 'package:google_maps_routes/google_maps_routes.dart';
import 'dart:ui' as ui;
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }
//
// class MapSampleState extends State<MapSample> {
//   Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemNavigator, rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import 'package:islamic_app/Pages/Page.dart';
// import 'package:islamic_app/Utilities/Utility.dart';
import 'package:geolocator/geolocator.dart';

// final LatLngBounds sydneyBounds = LatLngBounds(
//   southwest: const LatLng(-34.022631, 150.620685),
//   northeast: const LatLng(-33.571835, 151.325952),
// );

class MapUiPage extends StatefulWidget {
  //MapUiPage() : super(const Icon(Icons.map), 'User interface');

  @override
  Widget build(BuildContext context) {
    return const MapUiBody();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

// class AppConstant {
//   static List<Map<String, dynamic>> list = [
//     {"title": "Liaquatabad", "id": "1", "lat": 24.9107, "lon": 67.0311},
//     {"title": "Malir", "id": "2", "lat": 24.8937, "lon": 67.2163},
//     {"title": "Shersha", "id": "3", "lat": 24.8850, "lon": 66.9973},
//   ];
//}

class MapUiBody extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MapUiBody();
  @override
  State<StatefulWidget> createState() => MapUiBodyState();
}

class MapUiBodyState extends State<MapUiBody> {
  MapUiBodyState();
  Position? position;

  static CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(24.8607, 67.0011),
    zoom: 10.0,
  );
  Iterable markers = [];
  //final Uint8List markerimgae = Uint8List(0);
  BitmapDescriptor customIcon1 = BitmapDescriptor.defaultMarker;
  List<MarkerId> listMarkerIds = List<MarkerId>.empty(growable: true);
  void AddMarker() async{

   DataSnapshot dataa= await HomeController().future();
  // print(dataa.value);/
   Map<dynamic,dynamic> map= dataa.value;
   for (var element in map.values) {
    // print(element);
   }

    App.LocaitonModel.isEmpty?print("empty"): print("data is here");
   // print( App.LocaitonModel.map((e) => e.name));
   // print( App.LocaitonModel.map((e) => e.latitude));
    Iterable _markers = Iterable.generate(
        App.LocaitonModel.length, (index) {
      return Marker(
        onTap: (){
          print("User");
          double? latitude = App.LocaitonModel[index].latitude;
          print(latitude);
          double longitude = App.LocaitonModel[index].longitude;
          print(longitude);
          String? ownername = App.LocaitonModel[index].ownerNAme;
          String? contact = App.LocaitonModel[index].contact;
          String? city = App.LocaitonModel[index].city;
          String? bedsperroom = App.LocaitonModel[index].bedsperroom;
          String? facilities = App.LocaitonModel[index].facilities;
          String? seatrent=App.LocaitonModel[index].seatrent;
          String? seatavailable=App.LocaitonModel[index].seatavilable;
          String? hostelname=App.LocaitonModel[index].hostelname;
          String? tag = App.LocaitonModel[index].tag;
         // print(index);
         // Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeview, (route) => false);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignleHostelViewCard(longitude: longitude, bedsperroom: bedsperroom, contact: contact,
              seatavilable: seatavailable, hostelname: hostelname, latitude: latitude, facilities: facilities, seatrent: seatrent,
              tag: tag, city: city, ownerNAme: ownername,
            )),
          );
        },
          markerId: MarkerId(App.LocaitonModel[index].hostelname),
          position: LatLng(
            App.LocaitonModel[index].longitude,
            App.LocaitonModel[index].latitude,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          infoWindow: InfoWindow(
              title:
              App.LocaitonModel[index].hostelname,
          snippet:   "${App.LocaitonModel[index].city} ",),
      );
    });
    setState(() {
      markers = _markers;
    });
  }

  createMarker(context) {
    if (customIcon1 == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
        configuration,
        'assets/Icon.png',
      ).then((icon) {
        setState(() {
          customIcon1 = icon;
        });
      });
    }
  }
  CameraPosition _position = _kInitialPosition;
  bool _isMapCreated = false;
  bool _isMoving = false;
  bool _compassEnabled = true;
  bool _mapToolbarEnabled = true;
  CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
  //MapType _mapType = MapType.normal;
  bool _rotateGesturesEnabled = true;
  bool _scrollGesturesEnabled = true;
  bool _tiltGesturesEnabled = true;
  bool _zoomControlsEnabled = true;
  bool _zoomGesturesEnabled = true;
  bool _indoorViewEnabled = false;
  bool _myLocationEnabled = true;
  bool _myTrafficEnabled = false;
  bool _myLocationButtonEnabled = true;
  late GoogleMapController _controller;
  bool _nightMode = false;


  Future _getUserLocation() async {
    position = await GeolocatorPlatform.instance.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position!.latitude);
    print(position!.longitude);
    double distanceInMeters = await Geolocator.distanceBetween(
        24.8677171, 67.0816432, 24.9107, 67.0311);
    print("Total Distance is ${distanceInMeters * 2}");
  }

  getUserLocation() async {
    Position _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _kInitialPosition = CameraPosition(
        target: LatLng(_currentPosition.latitude, _currentPosition.longitude), zoom: 12);
  });
  }

  @override
  void initState() {
  //  createMarker(context);
    AddMarker();
    _getUserLocation().then((value) => setState(() {
      _kInitialPosition = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 12,
      );
     // AddMarker();
    }));
    getUserLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void _launchMapsUrl(double lat, double lon) async {
  //   final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

//  static final kInitialPosition = LatLng(24.8607, 67.0011);
  //late PickResult selectedPlace;
  TextEditingController controller = new TextEditingController();
  List<ScholarDetailModel> _searchResult = [];
  // List<ScholarDetailModel> scholarModelSample = ScholarDetailModel.sampleScholarDetailModel();

  @override
  Widget build(BuildContext context) {
    print("marker");
    AddMarker();
    final GoogleMap googleMap = GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: _kInitialPosition,
        compassEnabled: _compassEnabled,
        mapToolbarEnabled: _mapToolbarEnabled,
        cameraTargetBounds: _cameraTargetBounds,
        minMaxZoomPreference: _minMaxZoomPreference,
        mapType: MapType.normal,
        rotateGesturesEnabled: _rotateGesturesEnabled,
        scrollGesturesEnabled: _scrollGesturesEnabled,
        tiltGesturesEnabled: _tiltGesturesEnabled,
        zoomGesturesEnabled: _zoomGesturesEnabled,
        zoomControlsEnabled: _zoomControlsEnabled,
        indoorViewEnabled: _indoorViewEnabled,
        myLocationEnabled: _myLocationEnabled,
        myLocationButtonEnabled: _myLocationButtonEnabled,
        trafficEnabled: _myTrafficEnabled,
        onCameraMove: _updateCameraPosition,
        markers: Set.from(markers));
    Size size = Get.size;
    map(){
      return Center(
        child: SizedBox(
          width: size.width,
          height:size.height,
          child: googleMap,
          // child: PlacePicker(
          //   apiKey: "AIzaSyAq5-LBqzGgmoKLqgiuc2vVS8HPpwTI-ek",
          //   initialPosition: kInitialPosition,
          //   //useCurrentLocation: true,
          //   selectInitialPosition: true,
          //   onMapCreated: onMapCreated,
          //   // markers: _markers,
          //   //usePlaceDetailSearch: true,
          //
          //   onPlacePicked: (result) {
          //     selectedPlace = result;
          //     Navigator.of(context).pop();
          //     setState(() {});
          //   },
          //   //forceSearchOnZoomChanged: true,
          //   //automaticallyImplyAppBarLeading: false,
          //   //autocompleteLanguage: "ko",
          //   //region: 'au',
          //   //selectInitialPosition: true,
          //   // selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
          //   //   print("state: $state, isSearchBarFocused: $isSearchBarFocused");
          //   //   return isSearchBarFocused
          //   //       ? Container()
          //   //       : FloatingCard(
          //   //           bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
          //   //           leftPosition: 0.0,
          //   //           rightPosition: 0.0,
          //   //           width: 500,
          //   //           borderRadius: BorderRadius.circular(12.0),
          //   //           child: state == SearchingState.Searching
          //   //               ? Center(child: CircularProgressIndicator())
          //   //               : RaisedButton(
          //   //                   child: Text("Pick Here"),
          //   //                   onPressed: () {
          //   //                     // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
          //   //                     //            this will override default 'Select here' Button.
          //   //                     print("do something with [selectedPlace] data");
          //   //                     Navigator.of(context).pop();
          //   //                   },
          //   //                 ),
          //   //         );
          //   // },
          //   // pinBuilder: (context, state) {
          //   //   if (state == PinState.Idle) {
          //   //     return Icon(Icons.favorite_border);
          //   //   } else {
          //   //     return Icon(Icons.favorite);
          //   //   }
          //   // },
          // )
        ),
      );
    }
    return Scaffold(
            key: globalKey,
            // appBar: AppBar(
            //   // backgroundColor: Colors.blue,
            //   elevation: 0,
            //   title: Text("Locations"),
            //   centerTitle: true,
            //   // flexibleSpace: Container(
            //   //   decoration: BoxDecoration(
            //   //     image: DecorationImage(
            //   //       image: AssetImage(('images/NavBarBG.png')),
            //   //       fit: BoxFit.cover,
            //   //     ),
            //   //   ),
            //   // ),
            // ),
      appBar: AppBar(
        title: Text("Hostles Near You"),
      ),
        drawer: drawer(),
            body:  Stack(
              children: [
                Positioned(
                  bottom: 0,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: map(),
                ),
              ]
                ));
  }
  drawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/Icon.png'),
            ),
            otherAccountsPictures: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/Icon.png'),
              )
            ],
            accountEmail: const Text('dev.yakkuza@gmail.com'),
            accountName: const Text('Dev Yakuza'),
            onDetailsPressed: () {
              // ignore: avoid_print
              print('press details');
            },
            decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
          ),
          ListTile(
              title: const Text('HomePage'),
              onTap: () {
                // ignore: avoid_print
                print("homepage click");
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
              }
          ),
          ListTile(
            title: const Text('Go to Admin'),
            onTap: () {

              MaterialPageRoute(
                builder: (BuildContext context) => PromptScreen(),
              );
              SystemNavigator.pop();
            },
          ),
          ListTile(
            title: const Text('Exit'),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  // void searchOperation(String searchText) {
  //   _searchResult.clear();
  //
  //   if (_isSearching != null) {
  //     List<Marker> _searchMarkers = <Marker>[];
  //     for (int i = 0;
  //     i < ScholarDetailModel.sampleScholarDetailModel().length;
  //     i++) {
  //       ScholarDetailModel data =
  //       ScholarDetailModel.sampleScholarDetailModel()[i];
  //       print(data);
  //       if (data.name.toLowerCase().contains(searchText.toLowerCase())) {
  //         _searchResult.add(data);
  //         var aa = Marker(
  //             markerId: MarkerId(data.name),
  //             position: LatLng(
  //               data.latitude,
  //               data.longitude,
  //             ),
  //             icon: BitmapDescriptor.defaultMarkerWithHue(
  //                 BitmapDescriptor.hueCyan),
  //             infoWindow: InfoWindow(title: data.name));
  //         _searchMarkers.add(aa);
  //         setState(() {
  //           _searchResult.length != 0 || _searchController.text.isNotEmpty
  //               ? markers = _searchMarkers
  //               : print("all marker");
  //         });
  //       } else {
  //         print("nothing");
  //       }
  //     }
  //   }
  // }

  void _updateCameraPosition(CameraPosition position) {
    setState(() {
      _position = position;
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
      _isMapCreated = true;
    });
  }
}

class ScholarDetailModel {
  String name;
  String Address;
  double longitude;
  double latitude;
  String phoneNo;

  ScholarDetailModel({
    required this.name,
    required this.Address,
    required this.longitude,
    required this.latitude,
    required this.phoneNo,
  });

  Future<double> getcalculateDistance() async {
    // LatLng currentPostion;
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    print("Userr detail");
    print("user longitude is $longitude");
    print("user latitude is $latitude");
    print("current longitude is ${position.latitude}");
    print("current longitude is ${position.longitude}");

    // double distanceInMeters = await Geolocator.distanceBetween(a,  b, aa, bb);
    //  print("user Distance is $distanceInMeters");

    //  double distanceInMeters =  calculateDistance(a,b,aa,bb);
    // setState(() {
    //   print(position.latitude);
    // });

    // double distanceInMeters =  calculateDistance(latitude,longitude,position.latitude,position.longitude);
    //
    // double distanceInKiloMeters = distanceInMeters / 1000;
    // double roundDistanceInKM = double.parse((distanceInKiloMeters).toStringAsFixed(2));
    // print(distanceInMeters);
    // print(distanceInKiloMeters);
    // print(roundDistanceInKM + 1);
    return 0.0;
  }

  // static List<ScholarDetailModel> sampleScholarDetailModel() {
  //   //   calculateDistance();
  //   List<ScholarDetailModel> models = [
  //     ScholarDetailModel(
  //       name: "Usama",
  //       Address: "Abc road liaquatabad town",
  //       latitude: 24.90183,
  //       longitude: 67.040502,
  //       phoneNo: "12",
  //     ),
  //     ScholarDetailModel(
  //       name: "Hakim",
  //       Address: "xyz road liyari town",
  //       latitude: 24.962397,
  //       longitude: 67.054055,
  //       phoneNo: "16",
  //     ),
  //     ScholarDetailModel(
  //       name: "Adeel",
  //       Address: "abc road shadman town",
  //       latitude: 24.962397,
  //       longitude: 67.054055,
  //       phoneNo: "01",
  //     ),
  //     ScholarDetailModel(
  //       name: "Waqas",
  //       Address: "xyz road Water Pump",
  //       latitude: 24.936822,
  //       longitude: 67.075996,
  //       phoneNo: "01",
  //     ),
  //     ScholarDetailModel(
  //       name: "Ahsan",
  //       Address: "abc road jauhar town",
  //       latitude: 24.928423,
  //       longitude: 67.135825,
  //       phoneNo: "01",
  //     ),
  //     ScholarDetailModel(
  //       name: "Sabir Chandio",
  //       Address: "abc road liyari town",
  //       latitude: 24.873764,
  //       longitude: 67.010288,
  //       phoneNo: "01",
  //     ),
  //     ScholarDetailModel(
  //       name: "Aamir",
  //       Address: "xyz road gulshan town",
  //       latitude: 24.920733,
  //       longitude: 67.088162,
  //       phoneNo: "01",
  //     ),
  //     ScholarDetailModel(
  //       name: "Faraz",
  //       Address: "abc road gulberg town",
  //       latitude: 24.936817,
  //       longitude: 67.076,
  //       phoneNo: "01",
  //     ),
  //     ScholarDetailModel(
  //       name: "Tariq",
  //       Address: "xyz road Samnabad ",
  //       latitude: 24.946437,
  //       longitude: 67.070436,
  //       phoneNo: "01",
  //     ),
  //     ScholarDetailModel(
  //       name: "Jauhar",
  //       Address: "abc road jauhar town",
  //       latitude: 24.904771,
  //       longitude: 67.113288,
  //       phoneNo: "01",
  //     ),
  //   ];
  //   return models;
  // }
}

class App{
  static List<LocationModel> LocaitonModel =   <LocationModel>[];
}

class LocationModel{
  String ownerNAme;
  String city;
  String contact;
  double latitude;
  double longitude;
  String seatavilable;
  String seatrent;
  String bedsperroom;
  String facilities;
  String tag;
  String hostelname;


  LocationModel({required this.ownerNAme,required this.contact,required this.city,
    required this.longitude,required this.latitude,required this.hostelname,required this.tag,
    required this.facilities,required this.bedsperroom,required this.seatrent,required this.seatavilable});
}