import 'package:flutter/material.dart';

class ServiceCardContentWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;

  ServiceCardContentWidget({this.color, this.icon, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
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
}
