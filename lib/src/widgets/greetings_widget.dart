import 'package:flutter/material.dart';

class GreetingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
