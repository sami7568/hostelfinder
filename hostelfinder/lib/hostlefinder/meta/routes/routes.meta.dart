import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/core/bin/map/mapuiBinding.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';
import 'package:hostelfinder/hostlefinder/view/home/widget/MapUiPage.dart';

class AppRoutes {
  // Routes Name
  static const String splash = "/splash_view";
  static const String home = "/home_view";
  static const String map = "/Map_view";
  static const String homeview = "/HomeRecordView";
  // Routes
  List<GetPage<dynamic>>? routes = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: map,
      page: () => const MapUiBody(),
      binding: MapUiBinding(),
    ),
    GetPage(
      name: homeview,
      page: ()=> HomeRecordView(),
      binding: HomeBinding(),
    ),

  ];
}
