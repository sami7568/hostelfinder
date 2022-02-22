import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

class FirebaseDataModel {
  String? tag;
  String? city;
  String? contact;
  String? directions;
  String? ownername;
  String? hostelname;
  String? seatavilable;
  String? seatrent;
  String? facilities;
  String? bedsperroom;
  //List<String>? rating;

  FirebaseDataModel({
    this.tag,
    this.city,
    this.contact,
    this.directions,
    this.ownername,
    this.hostelname,
    this.seatavilable,
    this.seatrent,
    this.facilities,
    this.bedsperroom,
   // this.rating,
  });

  factory FirebaseDataModel.processor(dynamic element) {
    return FirebaseDataModel(
      tag: element.key,
      city: element.value['city'],
      contact: element.value['contact'],
      directions: element.value['directions'],
      ownername: element.value['owner_name'],
      hostelname: element.value['hostel_name'],
      seatavilable: element.value['avilable_seats'],
      seatrent: element.value['seat_rent'],
      bedsperroom: element.value['bedsperroom'],
      facilities: element.value['facilities'],
      //rating: element.value['rating'],
    );
  }

  List<FirebaseDataModel> getList(DataSnapshot data) {
    List<FirebaseDataModel> list = [];

    data.value.entries.forEach((element) {
      list.add(FirebaseDataModel.processor(element));
    });
    return list;
  }
}
class RatingDataModel {
  String? tag;
  String? rating;

  RatingDataModel({
    this.tag,
    this.rating,
  });

  factory RatingDataModel.processor(dynamic element) {
    return RatingDataModel(
      tag: element.value['tag'],
      rating: element.value['rating'],

    );
  }

  List<RatingDataModel> getList(DataSnapshot data) {
    List<RatingDataModel> list = [];
    data.value.entries.forEach((element) {
      list.add(RatingDataModel.processor(element));
    });
    return list;
  }
}
