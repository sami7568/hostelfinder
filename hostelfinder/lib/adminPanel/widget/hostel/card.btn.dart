import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class CardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onTap;

  const CardButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Material(
      color: bgColor,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.007,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.white,
              ),
              SizedBox(width: size.width * 0.04),
              Text(
                title,
                style: GoogleFonts.openSans(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
