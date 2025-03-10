import 'package:geolocator/geolocator.dart';

late double lat;
late double long;
Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error("location desabled");
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error("Location permission");
  }
  return await Geolocator.getCurrentPosition();
}

void liveLocation() {
  LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, distanceFilter: 10);

  Geolocator.getPositionStream(locationSettings: locationSettings)
      .listen((Position position) {
    lat = position.latitude;
    long = position.longitude;
  });
}
