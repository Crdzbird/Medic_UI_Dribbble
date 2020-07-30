import 'package:flutter/material.dart';
import 'package:medical_app/src/widgets/historic_bottom_sheet_widget.dart';

class HistoricPage extends StatelessWidget {
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
                    'Appointment Details',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                    ),
                  ),
                  subtitle: Text(
                    "All appointment details here",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          HistoricBottomSheetWidget(),
        ],
      ),
    );
  }
}
