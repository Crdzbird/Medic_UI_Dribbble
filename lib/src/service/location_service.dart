import 'package:location/location.dart';
import 'package:medical_app/src/models/coordinates_location.dart';

class LocationService {
  var location = Location();

  Future<CoordinatesLocation> getLocation() async {
    try {
      var currLocation = await location.getLocation();
      return CoordinatesLocation(
          latitude: currLocation.latitude, longitude: currLocation.longitude);
    } on Exception catch (e) {
      print("Unable to get location: ${e.toString()}");
      return null;
    }
  }
}
