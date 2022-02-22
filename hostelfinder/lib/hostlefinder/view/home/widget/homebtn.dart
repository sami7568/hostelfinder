import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

class CardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onTap;
  const CardButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.bgColor,
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

class MapButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onTap;
  const MapButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return  InkWell(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.014,
          ),
          width: size.width / 4.2,
          //height: ,
          margin: EdgeInsets.symmetric(
           // vertical: size.height * 0.01,
           horizontal: size.width * 0.03,
          ),
         // clipBehavior: Clip.antiAliasWithSaveLayer,

          decoration:BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.white,
              ),
              SizedBox(width: 2),
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
      );
    //);
    //alignment: Alignment.center,
  }
}
