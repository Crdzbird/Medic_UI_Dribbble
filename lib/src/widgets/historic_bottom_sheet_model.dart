import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medical_app/src/models/doctors.dart';

class HistoricBottomSheetModel extends StatelessWidget {
  final Doctors doctor;
  final double percentageCompleted;

  HistoricBottomSheetModel({Key key, this.doctor, this.percentageCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (percentageCompleted == 1) ? Colors.white : Colors.transparent,
      ),
      child: Transform.scale(
        alignment: Alignment.topLeft,
        scale: 1 / 3 + 2 / 3 * percentageCompleted,
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  color: (intInRange(1, 2) == 1)
                      ? Color.fromRGBO(77, 221, 136, 1.0)
                      : Color.fromRGBO(255, 120, 88, 1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'July 29',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        doctor.hoursAvailable[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: max(0, percentageCompleted * 2 - 1),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    doctor.name,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    doctor.speciality,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: width * 0.15,
                              height: height * 0.03,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                ),
                                color: Color.fromRGBO(242, 116, 179, 1.0),
                              ),
                              child: Text(
                                'New',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int intInRange(int initialValue, int finalValue) =>
      initialValue + Random().nextInt(finalValue - initialValue);
}
