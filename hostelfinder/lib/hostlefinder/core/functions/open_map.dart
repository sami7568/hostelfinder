import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';

void openMap({
  required String name,
  required Coords coordinates,
}) async {
  bool? status = await MapLauncher.isMapAvailable(MapType.google);
  if (status != null) {
    if (status) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: coordinates,
        title: name,
      );
    } else {
      Get.snackbar(
        "Can't open map",
        "Can't open this location or You've not installed google map in your app",
      );
    }
  } else {
    Get.snackbar(
      "Can't open map",
      "Can't open this location or You've not installed google map in your app",
    );
  }
}
