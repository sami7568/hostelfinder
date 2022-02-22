import 'package:hostelfinder/adminPanel//meta/hooks/hook.dart';
import 'package:get/get.dart';
import 'package:hostelfinder/select.dart';

class AppRoutes {
  static const home = "/home_view";
  static const login = "/login_view";
  static const signup = "/signup_view";
  static const splash = "/splash_view";
  static const addHostel = "/add_hostel_view";
  static const updateHostel = "/update_hostel_view";
 static const selectpage  = "/select";
  List<GetPage<dynamic>>? routes = [
    GetPage(
      name: splash,
      binding: SplashBinding(),
      page: () => const SplashView(),
    ),
    GetPage(
      name: login,
      binding: LoginBinding(),
      page: () => const LoginView(),
    ),
    GetPage(
      name: signup,
      binding: SignupBinding(),
      page: () => const SignupView(),
    ),
    GetPage(
      name: home,
      binding: HomeBinding(),
      page: () => const HomeView(),
    ),
    GetPage(
      name: addHostel,
      page: () => const AddHostelView(),
    ),
    GetPage(
      name: updateHostel,
      page: () => const UpdateHostelView(),
    ),
    GetPage(
      name: selectpage,
      page: () => PromptScreen(),
    )
  ];
}
