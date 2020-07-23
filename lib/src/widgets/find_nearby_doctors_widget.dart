import 'package:flutter/material.dart';

class FindNearbyDoctorsWidget extends StatelessWidget {
  final double percentage;

  FindNearbyDoctorsWidget({this.percentage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Visibility(
        visible: (percentage == 1) ? true : false,
        child: RaisedButton(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 10.0,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Text(
              'Find nearby Doctors',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            ),
          ),
          color: Color.fromRGBO(77, 221, 133, 0.8),
          shape: StadiumBorder(),
          onPressed: () {},
        ),
      ),
    );
  }
}
