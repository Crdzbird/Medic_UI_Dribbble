import 'package:flutter/material.dart';
import 'package:medical_app/src/models/coordinates_location.dart';
import 'package:medical_app/src/provider/doctors_provider.dart';
import 'package:medical_app/src/provider/location_provider.dart';
import 'package:medical_app/src/provider/services_provider.dart';
import 'package:medical_app/src/routes/routes.dart';
import 'package:medical_app/src/service/location_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ServicesProvider()),
        ChangeNotifierProvider(create: (context) => DoctorsProvider()),
        StreamProvider<CoordinatesLocation>(
            create: (context) => LocationProvider().locationStream),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        onGenerateRoute: generateRoutes,
      ),
    );
  }
}
