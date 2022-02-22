import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

class SearchInput extends GetView<HomeController> {

  FocusNode myFocusNode = FocusNode();
  String hintnam= "Search Hostel";
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Container(
      width: size.width -140,
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
        horizontal: size.width * 0.03,
      ),
      alignment: Alignment.center,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(size.height * 0.015),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        cursorColor: AppColors.white,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        controller: controller.searchController,
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w600,
          fontSize: size.height * 0.021,
          color: AppColors.white.withOpacity(0.85),
        ),
        onTap: (){
          controller.searchController.text = "";
      },
        decoration: InputDecoration(
          hintText:hintnam,
          hintStyle: GoogleFonts.openSans(
            fontSize: size.height * 0.021,
            fontWeight: FontWeight.normal,
            color: AppColors.white.withOpacity(0.85),
          ),
          prefixIcon: Icon(
            Icons.search_outlined,
            size: size.height * 0.03,
            color: AppColors.white.withOpacity(0.85),
          ),
          suffixIcon: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
