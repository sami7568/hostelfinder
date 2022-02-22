import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:hostelfinder/adminPanel/widget/hostel/MultiSelect.dart';
import 'package:get/get.dart';

class UpdateHostelView extends GetView<HomeController> {
  const UpdateHostelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Update Hostel Record"),
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
                  keyboard: TextInputType.name,
                  controller: controller.seatavilable,
                ),
                SizedBox(height: size.height * 0.02),
                CustomInput(
                  label: "Seats Rent",
                  icon: Icons.shopping_bag_sharp,
                  hint: "Enter Rent per Seats",
                  keyboard: TextInputType.name,
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
                CustomCheckboxWidget(controller: controller.facilities,isUpdate: true,),

                SizedBox(height: size.height * 0.02),
                CustomInput(
                  label: "bedsperroom",
                  icon: Icons.single_bed_outlined,
                  hint: "bedsperroom",
                  keyboard: TextInputType.name,
                  controller: controller.bedsperroom,
                ),
                SizedBox(height: size.height * 0.025),
                CustomButton(
                  title: "Update",
                  onTap: () => Get.defaultDialog(
                    title: "Want to update?",
                    middleText:
                        "are you sure? if you want to update then click on Update Button.",
                    textCancel: "Cancel",
                    textConfirm: "Update",
                    confirmTextColor: AppColors.white,
                    onConfirm: () {
                      Get.back();
                      controller.updateData().then((value) =>
                          Navigator.pop(context)
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
