import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/src/widgets/bypart_notched.dart';

class HomePage extends StatelessWidget {
  final colors = [Colors.greenAccent, Colors.redAccent, Colors.pinkAccent];
  final icons = [Icons.home, Icons.camera_alt, Icons.chat_bubble_outline];
  final title = ['Home Visit', 'Video call', ' Chats'];
  final subtitle = ['Accurate result', 'Face to face', 'Easy & efficient'];
  final doctorImage = [
    'assets/images/doc1.jpg',
    'assets/images/doc2.jpg',
    'assets/images/doc3.jpg',
    'assets/images/doc4.jpg'
  ];
  final specialities = ['Dentist', 'Cardio', 'Ortho', 'ENT'];

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
                  _appBar(context, screen),
                  _greetings(context, screen),
                  _services(context, screen),
                  SizedBox(
                    height: 10.0,
                  ),
                  _servicesCard(context, screen),
                  _topDocters(context, screen),
                  _doctorCard(context, screen),
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
      bottomNavigationBar: BottomAppBar(
        shape: ByPartNotched(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 20.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(
                  Icons.star_border,
                  color: Color.fromRGBO(0, 0, 0, 0.20),
                ),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 20.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(
                  Icons.calendar_today,
                  color: Color.fromRGBO(0, 0, 0, 0.20),
                ),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 20.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(
                  Icons.access_time,
                  color: Color.fromRGBO(0, 0, 0, 0.20),
                ),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 20.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(
                  Icons.location_on,
                  color: Color.fromRGBO(0, 0, 0, 0.20),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, Size screen) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: screen.width * 0.1 - screen.height * 0.015,
            backgroundImage: AssetImage('assets/images/pollo_asustado.jpg'),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.20),
                        blurRadius: 0.5,
                        offset: Offset.fromDirection(13),
                      )
                    ]),
                child: IconButton(
                  color: Color.fromRGBO(0, 0, 0, 0.20),
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  iconSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.more_vert,
            size: 40,
            color: Color.fromRGBO(0, 0, 0, 0.20),
          ),
        ],
      ),
    );
  }

  Widget _greetings(BuildContext context, Size screen) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, top: 23.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Hi Sam Thomas',
                style: TextStyle(
                  color: Color.fromRGBO(105, 105, 105, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Need a Doctor?',
                style: TextStyle(
                  color: Color.fromRGBO(69, 69, 69, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 29.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _topDocters(BuildContext context, Size screen) {
    return ListTile(
      leading: Text(
        'Top Docters',
        style: TextStyle(
          color: Color.fromRGBO(150, 150, 150, 1.0),
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      trailing: Text(
        'See all',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _services(BuildContext context, Size screen) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, top: 30.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Services',
                style: TextStyle(
                  color: Color.fromRGBO(150, 150, 150, 1.0),
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _servicesCard(BuildContext context, Size screen) {
    return Container(
      width: screen.width,
      height: screen.height * 0.25,
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(right: 7.0),
            child: _card(context, screen, colors[index], icons[index],
                title[index], subtitle[index]),
          );
        },
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15.0),
      ),
    );
  }

  Widget _card(BuildContext context, Size screen, MaterialAccentColor color,
      IconData icon, String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
      child: Container(
        width: screen.width * 0.31,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: screen.height * 0.115,
                      width: screen.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(15.0),
                        ),
                        color: color,
                      ),
                    ),
                    Center(
                      child: Icon(
                        icon,
                        size: screen.height * 0.05,
                        color: Color.fromRGBO(0, 0, 0, 0.20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 25.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Color.fromRGBO(118, 118, 118, 1.0),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 10.0),
              child: Text(
                subtitle,
                style: TextStyle(
                    color: Color.fromRGBO(118, 118, 118, 1.0),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _doctorCard(BuildContext context, Size screen) {
    return Container(
      width: screen.width,
      height: screen.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: doctorImage.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 15.0, right: 12.0, top: 10.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: screen.width * 0.25,
                      height: screen.height * 0.15,
                      padding:
                          EdgeInsets.only(left: 15.0, right: 20.0, top: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                            image: AssetImage(doctorImage[index]),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  specialities[index],
                  style: TextStyle(
                    color: Color.fromRGBO(156, 156, 156, 1.0),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
