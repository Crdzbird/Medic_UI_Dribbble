import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/src/models/doctors.dart';

class DoctorsProvider extends ChangeNotifier {
  final doctorImage = [
    'assets/images/doc1.jpg',
    'assets/images/doc2.jpg',
    'assets/images/doc3.jpg',
    'assets/images/doc4.jpg'
  ];

  final specialities = ['Dentist', 'Cardio', 'Ortho', 'ENT'];

  List<Doctors> _doctors = new List();
  int _size = 0;

  DoctorsProvider() {
    _loadDoctors();
  }

  List<Doctors> get services => _doctors;

  int get size => _size;

  _loadDoctors() {
    for (var i = 0; i < 3; i++) {
      this._doctors.add(new Doctors(
            speciality: specialities[i],
            image: doctorImage[i],
          ));
    }

    this._size = this._doctors.length;
  }
}
