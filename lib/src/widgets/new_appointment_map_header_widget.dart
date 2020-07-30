import 'package:flutter/material.dart';
import 'package:medical_app/src/provider/doctors_provider.dart';
import 'package:provider/provider.dart';

class NewAppointmentMapHeaderWidget extends StatelessWidget {
  final double fontSize;
  final double topMargin;
  final double leftPadding;
  final double rightPadding;
  final onToggle toggle;
  final dragUpdateCallback onDragUpdate;
  final dragEndCallback onDragEnd;

  const NewAppointmentMapHeaderWidget({
    Key key,
    @required this.fontSize,
    @required this.topMargin,
    @required this.leftPadding,
    @required this.rightPadding,
    this.toggle,
    this.onDragUpdate,
    this.onDragEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final provider = Provider.of<DoctorsProvider>(context);
    return Positioned(
      top: topMargin,
      width: screen.width,
      child: GestureDetector(
        onTap: toggle,
        onVerticalDragUpdate: onDragUpdate,
        onVerticalDragEnd: onDragEnd,
        child: Container(
          height: screen.height * 0.08,
          decoration: BoxDecoration(
            color: Color.fromRGBO(247, 247, 247, 1.0),
          ),
          padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: screen.width * 0.1 - screen.height * 0.015,
                backgroundImage: AssetImage(provider.doctors[0].image),
              ),
              SizedBox(
                width: screen.width * 0.05,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.doctors[0].name,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          provider.doctors[0].speciality,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.green,
                              size: 20.0,
                            ),
                            Text(
                              "${provider.doctors[0].rating.toStringAsPrecision(2)}",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: screen.width * 0.1,
                            ),
                            Icon(
                              Icons.message,
                              color: Colors.blueAccent,
                              size: 20.0,
                            ),
                            Text(
                              "${provider.doctors[0].comments}",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: screen.width * 0.1,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.lightGreen,
                              size: 20.0,
                            ),
                            Text(
                              "${provider.doctors[0].distance.toStringAsPrecision(3)} km",
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
            ],
          ),
        ),
      ),
    );
  }
}

typedef onToggle = void Function();
typedef dragUpdateCallback = void Function(DragUpdateDetails dragUpdateDetails);
typedef dragEndCallback = void Function(DragEndDetails dragEndDetails);
