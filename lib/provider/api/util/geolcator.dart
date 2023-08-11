import 'package:geocoding/geocoding.dart';
import 'package:logger/logger.dart';

Future<Location?> getLocationFromAddress(String address) async {
  try {
    List<Location> locations = await locationFromAddress(address);
    return locations.first;
  } catch (e) {
    Logger().d(e.toString() + address);
  }
}
