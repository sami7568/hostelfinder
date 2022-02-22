import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/core/controller/home/home.controller.dart';
import 'package:hostelfinder/hostlefinder/core/controller/home/home.controller.dart';
import 'package:hostelfinder/hostlefinder/core/model/firebase.model.dart';
import 'package:hostelfinder/hostlefinder/meta/colors/app.colors.meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostelfinder/hostlefinder/meta/firebase/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntegerExample extends StatefulWidget {
   String controller;

  IntegerExample({
    required this.controller,
  });

  @override
  _IntegerExampleState createState() =>
      _IntegerExampleState(controller: controller);
}

class _IntegerExampleState extends State<IntegerExample> {
    String controller;

  _IntegerExampleState({
    required this.controller,
  });

  @override
  void initState() {
    // TODO: implement initState

    fetchHostels(controller);
    super.initState();
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
               // ratingRecords.add(RatingDataModel.processor(value));
                setState(() {
                  ratingValue = RatingDataModel.processor(value).rating!;
                  print("Value is $rate");
                  print(ratingValue.isEmpty ? "1.0" : double.parse(ratingValue));
                  rate = double.parse(ratingValue);
                });

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

    @override
  Widget build(BuildContext context) {
    double customratingValue =  1.0;
    Size size = Get.size;

    return  Column(
      children: <Widget>[
        SizedBox(height: 2),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
              //  print();
            },
            child:  Icon(Icons.close, size: 28,color: Colors.black,),
          ),
        ),
        Row(
          children: [
            SizedBox(width: 8),
            Row(
              children: [
                Text(
                  "Current Rating:  ",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.openSans(
                    color: AppColors.black,
                    fontSize: size.height * 0.015,
                  ),
                ),
              //  SizedBox(width: 50,),

                RatingBar.builder(
                  initialRating:  rate,
                  //   initialRating: index > 10 ? 2.0: index.isEven  ? 3.0: 5.0 ,
                  //model.rating == null ? 0.0: double.parse("${model.rating}"),
                  tapOnlyMode: true,
                  ignoreGestures: true,
                  itemSize: 20.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 10,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    // controller.text = "$rating";
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            //SizedBox(width: 8),

            Spacer(),
          ],
        ),
        Spacer(),
        Text(
          'Add Rating',
          style: GoogleFonts.openSans(color: AppColors.black),
        ),

        RatingBar.builder(
          initialRating:  0,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 30,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
           // controller = "$rating";
            //setState(() {
            customratingValue  = rating;

           // });
          // HomeController().addRatingData(controller,"$rating",context);
          //   then((value) => Navigator.pop(context));
          },
        ),
        InkWell(
          child: Row(
    children: const [

      Spacer(),
      Text('Add') ,
      SizedBox(width: 12),
    ],
    ) ,
          onTap: () async {
            print(customratingValue);
            //print(rate);
            HomeController().addRatingData(controller,"${customratingValue}",context).then((value) =>
                //HomeController().addRatingData(widget.model.tag!,"4.0",context);
                Navigator.pop(context)
            );
            Navigator.pop(context);
            print("succecffluyllu");
            // Get.snackbar(
            //   "Added",
            //   "Rating successfully added.",
            //   backgroundColor: AppColors.main,
            //   colorText: AppColors.white,
            //   snackPosition: SnackPosition.BOTTOM,
            // );
            // print(widget.model.tag);
            // print(widget.index);
            // print("${ratingValue}");
            //
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // //prefs.setStringList('ratingKey', ["abc"]);
            //
            // var yourList = prefs.getStringList('ratingKey');
            // var yourList1 = <String>[];
            //
            // if(yourList ==null){
            //   yourList!.forEach((element) {
            //     yourList1.add(element);
            //   });
            // }else{}
            //
            // yourList1.add("${widget.index}");
            // prefs.setStringList('ratingKey', yourList1);
            //
            // var yourList2 = prefs.getStringList('ratingKey');
            // print(yourList2);
            //
            //
            //
            //



            // Fetch and decode data


         //   HomeController().updateData(widget.model, ["0.0,1.0,2.0"]);
          }
        ),
        SizedBox(height: 10),
      ],
    );
  }

}


class Music {
  final String id;
  final String  rating;

  Music({
   required this.id,
    required this.rating,

  });

  factory Music.fromJson(Map<String, dynamic> jsonData) {
    return Music(
      id: jsonData['id'],
      rating: jsonData['rating'],
    );
  }

  static Map<String, dynamic> toMap(Music music) => {
    'id': music.id,
    'rating': music.rating,
  };

  static String encode(List<Music> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => Music.toMap(music))
        .toList(),
  );

  static List<Music> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Music>((item) => Music.fromJson(item))
          .toList();
}