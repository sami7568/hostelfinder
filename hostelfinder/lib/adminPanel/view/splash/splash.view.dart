import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    controller.movePage();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                AppAssets.appIcon,
                height: size.height * 0.15,
              ),
              const Spacer(),
              Text(
                "Explore best Hostels",
                textAlign: TextAlign.center,
                style: GoogleFonts.antic(
                  color: AppColors.black,
                  fontSize: size.height * 0.027,
                ),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
