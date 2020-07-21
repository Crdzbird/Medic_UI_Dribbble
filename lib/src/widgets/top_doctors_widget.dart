import 'package:flutter/material.dart';

class TopDoctorsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
