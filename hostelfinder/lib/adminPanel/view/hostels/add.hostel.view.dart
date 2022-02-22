import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:hostelfinder/adminPanel/widget/hostel/MultiSelect.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AddHostelView extends GetView<HomeController> {
  const AddHostelView({Key? key}) : super(key: key);
  static final List<Facality> _animals = [
    Facality(id: 1, name: "Wi-fi"),
    Facality(id: 2, name: "Bath"),
    Facality(id: 3, name: "Ups"),
    Facality(id: 4, name: "Laundry"),
    Facality(id: 5, name: "Generator"),
    Facality(id: 6, name: "Meals"),
    Facality(id: 7, name: "Hot water"),
    Facality(id: 8, name: "Room Cleaning"),
    Facality(id: 9, name: "Gas in Rooms"),
    Facality(id: 10, name: "Kitchen with rooms"),
  ];

  //List<Animal> _selectedAnimals2 = [];


  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Add Hostel Record"),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.065,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.025),
                Text(
                  "Hostel Details",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.025,
                    color: AppColors.black.withOpacity(0.65),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                CustomInput(
                  label: "City Name",
                  hint: "Enter City Name",
                  controller: controller.city,
                  keyboard: TextInputType.name,
                  icon: Icons.location_city_outlined,
                ),
                SizedBox(height: size.height * 0.02),
                CustomInput(
                  label: "Contact No",
                  icon: Icons.phone_outlined,
                  hint: "Enter Contact Number",
                  keyboard: TextInputType.phone,
                  maxLines: 11,
                  controller: controller.contact,
                ),
                SizedBox(height: size.height * 0.02),
                CustomInput(
                  label: "Hostel Name",
                  hint: "Enter Hostel Name",
                  maxLines: null,
                  keyboard: TextInputType.name,
                  controller: controller.hostelName,
                  icon: Icons.edit_outlined,
                ),
                SizedBox(height: size.height * 0.02),
                CustomInput(
                  label: "Owner Name",
                  icon: Icons.person_outlined,
                  hint: "Enter Owner Name",
                  keyboard: TextInputType.name,
                  controller: controller.ownerName,
                ),
                SizedBox(height: size.height * 0.02),
                CustomInput(
                  label: "Seats Avilable",
                  icon: Icons.single_bed_outlined,
                  hint: "Enter Avilable Seats",
                  keyboard: TextInputType.number,
                  maxLines: 2,
                  controller: controller.seatavilable,
                ),
                SizedBox(height: size.height * 0.02),
                CustomInput(
                  label: "Seats Rent",
                  icon: Icons.shopping_bag_rounded,
                  hint: "Enter Rent per Seats",
                  keyboard: TextInputType.number,
                  maxLines: 4,
                  controller: controller.seatrent,
                ),
                SizedBox(height: size.height * 0.02),
                // CustomInput(
                //   label: "Facilites",
                //   icon: Icons.account_tree,
                //   hint: "Wifi,Bath,ups,laundry",
                //   keyboard: TextInputType.name,
                //   controller: controller.facilities,
                // ),

                CustomCheckboxWidget(controller: controller.facilities, isUpdate: false,),

                SizedBox(height: size.height * 0.025),

              //  SizedBox(height: size.height * 0.02),
                CustomInput(
                  label: "bedsperroom",
                  icon: Icons.single_bed_outlined,
                  hint: "bedsperroom",
                  keyboard: TextInputType.number,
                  maxLines: 1,
                  controller: controller.bedsperroom,
                ),
                SizedBox(height: size.height * 0.025),
                CustomButton(
                  title: "Add",
                  onTap: () => Get.defaultDialog(
                    title: "Want to Add?",
                    middleText:
                        "Double check your details and then click on Add button to add details of your hostel.",
                    textCancel: "Cancel",
                    textConfirm: "Add",
                    confirmTextColor: AppColors.white,
                    onConfirm: () {
                      Get.back();
                      controller.addData().then((value) =>
                          Navigator.pop(context)
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


