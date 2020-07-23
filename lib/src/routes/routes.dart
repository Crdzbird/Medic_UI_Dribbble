import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_app/src/pages/home_page.dart';
import 'package:medical_app/src/pages/new_appointment_page.dart';
import 'package:medical_app/src/pages/visit_page.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case 'home':
      return MaterialPageRoute(builder: (context) => HomePage());
      break;
    case 'visit':
      return MaterialPageRoute(builder: (context) => VisitPage());
      break;
    case 'appointment':
      return MaterialPageRoute(builder: (context) => NewAppointmentPage());
      break;
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
