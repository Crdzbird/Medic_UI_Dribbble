import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/src/widgets/appbar_widget.dart';
import 'package:medical_app/src/widgets/bottom_appbar_widget.dart';
import 'package:medical_app/src/widgets/doctor_card.dart';
import 'package:medical_app/src/widgets/greetings_widget.dart';
import 'package:medical_app/src/widgets/service_card_widget.dart';
import 'package:medical_app/src/widgets/title_widget.dart';
import 'package:medical_app/src/widgets/list_tile_widget.dart';

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
                  TitleWidget(
                    title: 'Services',
                    size: 15.0,
                    edges: EdgeInsets.only(left: 15.0, top: 30.0),
                    requiredContainer: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ServiceCardWidget(),
                  ListTileWidget(
                    leadingText: 'Top Doctors',
                    leadingTextSize: 17.0,
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                    trailingText: 'See all',
                    trailingColor: Colors.blue,
                    trailingTextSize: 14.0,
                  ),
                  DoctorCard(),
                  SizedBox(
                    height: 10.0,
                  ),
                  ListTileWidget(
                    leadingText: 'Specialist',
                    leadingTextSize: 17.0,
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                    trailingText: '',
                  ),
                  DoctorCard(),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'visit');
        },
        child: Icon(FontAwesomeIcons.stethoscope),
        backgroundColor: Color.fromRGBO(77, 221, 133, 1.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
