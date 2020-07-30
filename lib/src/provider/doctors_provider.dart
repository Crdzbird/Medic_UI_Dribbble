import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/src/models/doctors.dart';

class DoctorsProvider extends ChangeNotifier {
  final doctorImage = [
    'assets/images/d1.png',
    'assets/images/d2.png',
    'assets/images/d3.png',
    'assets/images/d4.png',
    'assets/images/d5.png',
    'assets/images/d6.jpg',
    'assets/images/d7.jpg',
    'assets/images/d8.jpg',
    'assets/images/d9.jpg',
  ];

  final specialities = [
    'Cardiologist',
    'Orthopedist',
    'Oncologist',
    'Orthopedist',
    'Ginecologist',
    'Entomologist',
    'Surgeon',
    'Dentist',
    'Oncologist'
  ];
  final names = [
    'Dr. Laurel Hoffman',
    'Dr. Johnny Ortiz',
    'Dr. Frank Coleman',
    'Dr. Rose Sullivan',
    'Dr. C',
    'Dr. D',
    'Dr. E',
    'Dr. X',
    'Dr. G'
  ];

  List<Doctors> _doctors = new List();
  int _size = 0;

  DoctorsProvider() {
    _loadDoctors();
  }

  double doubleInRange(int initialValue, int finalValue) =>
      Random().nextDouble() * (finalValue - initialValue) + finalValue;

  int intInRange(int initialValue, int finalValue) =>
      Random().nextInt(finalValue) * (finalValue - initialValue) + finalValue;

  List<Doctors> get doctors => _doctors;

  int get size => _size;

  _loadDoctors() {
    for (var i = 0; i < 9; i++) {
      this._doctors.add(
            new Doctors(
              id: i,
              speciality: specialities[i],
              image: doctorImage[i],
              name: names[i],
              rating: doubleInRange(1, 5),
              comments: intInRange(1, 500),
              distance: doubleInRange(10, 100),
            ),
          );
    }
    this._size = this._doctors.length;
  }
}
