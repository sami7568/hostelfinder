import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Position> getPositions() async {
  LocationPermission permission;

  await Permission.location.request();
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}
