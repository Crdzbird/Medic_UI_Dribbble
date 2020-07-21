import 'package:flutter/material.dart';
import 'package:medical_app/src/widgets/title_widget.dart';

class TopDoctorsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
      leading: TitleWidget(
        title: 'Top Doctors',
        size: 17.0,
        requiredContainer: false,
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
