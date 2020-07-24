import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:medical_app/src/models/coordinates_location.dart';
import 'package:medical_app/src/service/location_service.dart';

class LocationProvider {
  StreamController<CoordinatesLocation> _locationController =
      StreamController<CoordinatesLocation>();

  Stream<CoordinatesLocation> get locationStream => _locationController.stream;

  Location location = Location();

  LocationProvider() {
    location.requestPermission().then((granted) {
      if (((granted) == PermissionStatus.GRANTED)) {
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(CoordinatesLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
          }
        });
      }
    });
  }
}
