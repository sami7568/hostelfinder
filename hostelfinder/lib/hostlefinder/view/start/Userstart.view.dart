import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

class UserStartView extends StatelessWidget {
  const UserStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppSettings.name,
      theme: ThemeData(
        primaryColor: AppColors.main,
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes().routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
    );
  }
}
