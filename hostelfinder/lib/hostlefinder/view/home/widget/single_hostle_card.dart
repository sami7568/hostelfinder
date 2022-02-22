import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';
import 'package:hostelfinder/hostlefinder/view/home/widget/Rating.dart';

class SignleHostelViewCard extends StatelessWidget {
  String? ownerNAme;
  String? city;
  String? contact;
   double? latitude;
  double? longitude;
   String? seatavilable;
   String? seatrent;
   String? bedsperroom;
   String? facilities;
   String? tag;
   String? hostelname;

  SignleHostelViewCard({Key? key,required this.ownerNAme,
    required this.city,required this.contact, required this.latitude, required this.longitude, required this.seatavilable,
    required this.seatrent, required this.bedsperroom, required this.facilities, required this.tag, required this.hostelname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context){
    Size size = Get.size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: size.width,

          margin: EdgeInsets.only(
            left: size.width * 0.035,
            right: size.width * 0.035,
            bottom: size.height * 0.02,
          ),
          child: Material(
            elevation: 2.0,
            color: AppColors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(size.height * 0.015),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: size.width * 0.05),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hostelname!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              color: AppColors.main,
                              fontWeight: FontWeight.w700,
                              fontSize: size.height * 0.0215,
                            ),
                          ),
                          SizedBox(height: size.height * 0.0075),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                size: size.height * 0.025,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "Contact:  ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontSize: size.height * 0.015,
                                      ),
                                    ),
                                    Text(
                                      contact!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.016,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.0075),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: size.height * 0.025,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "Location:  ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.015,
                                        color: AppColors.black.withOpacity(0.7),
                                      ),
                                    ),
                                    Text(
                                      city!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.016,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                size: size.height * 0.025,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "Rent Per Seat:  ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.015,
                                        color: AppColors.black.withOpacity(0.7),
                                      ),
                                    ),
                                    Text(
                                      seatrent!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.016,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.0075),
                          Row(
                            children: [
                              Icon(
                                Icons.directions_boat,
                                size: size.height * 0.025,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "Seats Avilable:  ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.015,
                                        color: AppColors.black.withOpacity(0.7),
                                      ),
                                    ),
                                    Text(
                                      seatavilable!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.016,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height * 0.0075),
                          Row(
                            children: [
                              Icon(
                                Icons.account_tree,
                                size: size.height * 0.025,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "Facilites:  ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontSize: size.height * 0.015,
                                      ),
                                    ),
                                    Text(
                                      facilities!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.016,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.0075),
                          Row(
                            children: [
                              Icon(
                                Icons.single_bed_outlined,
                                size: size.height * 0.025,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "Beds Per Room:  ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontSize: size.height * 0.015,
                                      ),
                                    ),
                                    Text(
                                      bedsperroom!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.016,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.0075),

                          Row(
                            children: [
                              Icon(
                                Icons.person_outline_outlined,
                                size: size.height * 0.025,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "Owner Name:  ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontSize: size.height * 0.015,
                                      ),
                                    ),
                                    Text(
                                      ownerNAme!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.016,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.rate_review_rounded,
                          //       size: size.height * 0.025,
                          //       color: AppColors.black.withOpacity(0.6),
                          //     ),
                          //     SizedBox(width: size.width * 0.02),
                          //     // Expanded(
                          //     //   child: Row(
                          //     //     children: [
                          //     //       Text(
                          //     //         "Rating:  ",
                          //     //         textAlign: TextAlign.start,
                          //     //         style: GoogleFonts.openSans(
                          //     //           color: AppColors.black,
                          //     //           fontSize: size.height * 0.015,
                          //     //         ),
                          //     //       ),
                          //     //
                          //     //       RatingBar.builder(
                          //     //         initialRating:  HomeController().rate,
                          //     //
                          //     //      //   initialRating: index > 10 ? 2.0: index.isEven  ? 3.0: 5.0 ,
                          //     //        //model.rating == null ? 0.0: double.parse("${model.rating}"),
                          //     //         tapOnlyMode: true,
                          //     //         ignoreGestures: true,
                          //     //         itemSize: 20.0,
                          //     //         itemBuilder: (context, _) => Icon(
                          //     //           Icons.star,
                          //     //           color: Colors.amber,
                          //     //           size: 10,
                          //     //         ),
                          //     //         onRatingUpdate: (rating) {
                          //     //           print(rating);
                          //     //           // controller.text = "$rating";
                          //     //         },
                          //     //       ),
                          //     //     ],
                          //     //   ),
                          //     // ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: CardButton(
                        title: "Call",
                        icon: Icons.call_outlined,
                        bgColor: Colors.blueGrey,
                        onTap: () => makePhoneCall(contact!),
                      ),
                    ),
                    Expanded(
                      child: CardButton(
                        title: "Location",
                        icon: Icons.location_city_outlined,
                        bgColor: Colors.lightBlueAccent,
                        onTap: () => openMap(
                          name: hostelname!,
                          coordinates: Coords(
                            double.parse(latitude!.toString()),
                            double.parse(longitude!.toString()),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CardButton(
                          title: "Rating",
                          icon: Icons.rate_review_rounded,
                          bgColor: Colors.blueGrey,
                          onTap: () {
                            // updateModel.value = model;
                            // setUpdateValues(model);
                             showMapDialog(context,tag,);
                          }
                      ),
                    ),
                    //),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // RxBool isRequsted = false.obs;
  // double ratingValue = 1.0;

  // Future<String> fetchHostels(String tags) async {
  //   DataSnapshot? snapshot;
  //
  //   isRequsted.value = false;
  //   //Created Object of RootController
  //   var con = Get.find<HomeController>();
  //   // Making path
  //   // tagsList.forEach((element) {
  //
  //   String path = "${FirebaseServices.ratingPath}/${tags}";
  //   // Fetch Hostels ID
  //   // record.clear();
  //
  //   con.dbRating.child(path).get().then((value) {
  //     isRequsted.value = true;
  //
  //     if (value.exists) {
  //       snapshot = value;
  //       value.value.entries.forEach((element) {
  //         String hostelPath = "${FirebaseServices.ratingPath}/${element.key}";
  //         con.dbRating.child(hostelPath).get().then((value) {
  //           print(value.value);
  //
  //           if (value.exists) {
  //             print("Rating is ${RatingDataModel.processor(value).tag}");
  //             print("Rating is ${RatingDataModel.processor(value).rating}");
  //            // ratingRecords.add(RatingDataModel.processor(value));
  //             ratingValue = double.parse(RatingDataModel.processor(value).rating!) ;
  //
  //           }
  //         });
  //       });
  //     }
  //
  //   });
  //   //  });
  //
  //   print(ratingValue);
  //  // print(ratingValue.isEmpty ? "1.0" : double.parse(ratingValue) ;);
  //   return "";
  // }
  // double getRate(){
  //   double getRate = 2.0;
  //   HomeController().fetchHostels(model.tag!).then((value) =>
  //   print( HomeController().rate)
  //
  //   );
  //   print("all rate $getRate");
  //   return  getRate;
  // }
  showMapDialog(BuildContext context,String? tag){
    showDialog(
        context: context,
        builder: (BuildContext context) {

          return Dialog(
            insetPadding: EdgeInsets.all(8),
            //contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(5.0)), //this right here
            child: Container(
              height: 140,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 1,color: AppColors.black),
                  borderRadius: BorderRadius.all(
                      Radius.circular(Get.size.height * 0.01) //                 <--- border radius here
                  )),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: IntegerExample(controller: tag!,),
              ),
            ),
          );
        });
  }

  void setUpdateValues(FirebaseDataModel model) {
    model.city = updateModel.value.city!;
    model.directions = updateModel.value.directions!;
    model.contact = updateModel.value.contact!;
    model.ownername = updateModel.value.ownername!;
    model.hostelname = updateModel.value.hostelname!;
    model.seatavilable = updateModel.value.seatavilable!;
    model.seatrent = updateModel.value.seatrent!;
    model.facilities= updateModel.value.facilities!;
    model.bedsperroom  =updateModel.value.bedsperroom!;
    //model.rating= updateModel.value.rating!;
  }

}
