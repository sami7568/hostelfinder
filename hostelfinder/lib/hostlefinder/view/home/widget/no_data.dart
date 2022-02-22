import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Center(
      child: Text(
        "No Data Found",
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w600,
          fontSize: size.height * 0.024,
          color: AppColors.black.withOpacity(0.85),
        ),
      ),
    );
  }
}
