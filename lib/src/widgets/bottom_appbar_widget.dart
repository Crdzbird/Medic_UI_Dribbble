import 'package:flutter/material.dart';

import 'bypart_notched.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
              onPressed: () {
                Navigator.pushNamed(context, 'appointment');
              },
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
    );
  }
}
