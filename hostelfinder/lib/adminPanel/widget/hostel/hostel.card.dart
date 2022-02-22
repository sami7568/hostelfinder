import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class HostelViewCard extends StatelessWidget {
  final FirebaseDataModel model;

  const HostelViewCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    HomeController controller = Get.find<HomeController>();
    return Container(
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
                        "${model.hostelname}",
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
                                  "${model.contact}",
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
                                  "${model.city}",
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
                                  "${model.seatrent}",
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
                                  "${model.seatavilable}",
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
                                  "${model.ownername}",
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
                                  "${model.facilities}",
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
                                  "${model.bedsperroom}",
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
                    title: "Update",
                    bgColor: Colors.blueGrey,
                    icon: Icons.edit_outlined,
                    onTap: () {
                      controller.updateModel.value = model;
                      controller.setUpdateValues();
                      Get.toNamed(AppRoutes.updateHostel);
                    },
                  ),
                ),
                Expanded(
                  child: CardButton(
                    title: "Delete",
                    bgColor: Colors.red.shade600,
                    icon: Icons.delete_outline_outlined,
                    onTap: () => Get.defaultDialog(
                      title: "Want to Delete?",
                      middleText:
                          "are you sure? if you really want to Delete your hostel then click on Delete Button.",
                      textCancel: "Cancel",
                      textConfirm: "Delete",
                      confirmTextColor: AppColors.white,
                      onConfirm: () {
                        Get.back();
                        controller.deleteData(model.tag!);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
