import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body();
  }
  body(){
    Size size = Get.size;
    controller.movePage();
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                AppAssets.appICON,
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
