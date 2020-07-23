import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medical_app/src/models/doctors.dart';

class BottomSheetIconWidget extends StatelessWidget {
  final Doctors doctor;
  final double percentageCompleted;

  BottomSheetIconWidget({Key key, this.doctor, this.percentageCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                child: Image.asset(
                  doctor.image,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
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
                    padding: EdgeInsets.all(8),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.green,
                                    size: 20.0,
                                  ),
                                  Text(
                                    "${doctor.rating.toStringAsFixed(1)}",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: width * 0.3,
                                  ),
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.lightGreen,
                                    size: 20.0,
                                  ),
                                  Text(
                                    "${doctor.distance.toStringAsFixed(1)} km",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
}
