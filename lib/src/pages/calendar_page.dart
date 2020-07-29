import 'package:flutter/material.dart';
import 'package:medical_app/src/widgets/calendar_dropdown_widget.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(104, 217, 151, 0.6),
          ),
          SafeArea(
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(top: 25.0, left: 15.0),
                  leading: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text(
                    'Book new Appointment',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                    ),
                  ),
                  subtitle: Text(
                    "When is the best time for an appointment?",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          CalendarDropDownWidget(),
        ],
      ),
    );
  }
}
