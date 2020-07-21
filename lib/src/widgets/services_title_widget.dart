import 'package:flutter/material.dart';

class ServicesTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
