import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class AdminStartView extends StatelessWidget {
  const AdminStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.main,
        appBarTheme: AppBarTheme(
          elevation: 1.5,
          backgroundColor: AppColors.main,
          iconTheme: IconThemeData(
            opacity: 0.85,
            color: AppColors.white,
          ),
          titleTextStyle: GoogleFonts.openSans(
            color: AppColors.white,
            fontSize: Get.size.height * 0.022,
          ),
        ),
      ),
      title: AppSettings.appName,
      initialBinding: RootBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes().routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
    );
  }
}
