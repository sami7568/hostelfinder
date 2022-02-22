import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Material(
      color: AppColors.main,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(size.height * 0.015),
      child: InkWell(
        onTap: () => onTap(),
        splashColor: AppColors.black.withOpacity(0.45),
        child: Container(
          width: size.width,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: size.height * 0.021,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.015,
          ),
        ),
      ),
    );
  }
}
