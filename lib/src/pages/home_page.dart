import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/src/widgets/appbar_widget.dart';
import 'package:medical_app/src/widgets/bottom_appbar_widget.dart';
import 'package:medical_app/src/widgets/doctor_card.dart';
import 'package:medical_app/src/widgets/greetings_widget.dart';
import 'package:medical_app/src/widgets/service_card_widget.dart';
import 'package:medical_app/src/widgets/services_title_widget.dart';
import 'package:medical_app/src/widgets/top_doctors_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: screen.width,
              height: screen.height,
              decoration:
                  BoxDecoration(color: Color.fromRGBO(249, 247, 248, 1.0)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  AppBarWidget(),
                  GreetingsWidget(),
                  ServicesTitleWidget(),
                  SizedBox(
                    height: 10.0,
                  ),
                  ServiceCardWidget(),
                  TopDoctorsWidget(),
                  DoctorCard(),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesomeIcons.stethoscope),
        backgroundColor: Color.fromRGBO(77, 221, 133, 1.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
