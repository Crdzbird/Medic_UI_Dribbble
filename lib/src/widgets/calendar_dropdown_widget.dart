import 'dart:math' as math;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medical_app/src/provider/doctors_provider.dart';
import 'package:medical_app/src/widgets/botom_sheet_button_widget.dart';
import 'package:medical_app/src/widgets/map_widget.dart';
import 'package:medical_app/src/widgets/medic_bottom_sheet_widget.dart';
import 'package:medical_app/src/widgets/new_appointment_map_header_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

const double minHeight = 120;
const double iconStartSize = 44;
const double iconEndSize = 120;
const double iconStartMarginTop = 36;
const double iconEndMarginTop = 80;
const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;

class CalendarDropDownWidget extends StatefulWidget {
  @override
  _CalendarDropDownWidgetState createState() => _CalendarDropDownWidgetState();
}

class _CalendarDropDownWidgetState extends State<CalendarDropDownWidget>
    with SingleTickerProviderStateMixin {
  DoctorsProvider provider;
  AnimationController _controller;
  CalendarController _calendarController;
  double get maxHeight => MediaQuery.of(context).size.height * 0.8;
  double get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top);
  double get headerFontSize => lerp(14, 24);
  double get itemBorderRadius => lerp(8, 24);
  double get iconLeftBorderRadius => itemBorderRadius;
  double get iconRightBorderRadius => lerp(8, 0);
  double get iconSize => lerp(iconStartSize, iconEndSize);
  double iconTopMargin(int index) =>
      lerp(iconStartMarginTop,
          iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize)) +
      headerTopMargin;
  double iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _calendarController.dispose();
    provider?.dispose();
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<DoctorsProvider>(context);
    final screen = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: lerp(minHeight, maxHeight),
            decoration: BoxDecoration(
              color: Color.fromRGBO(247, 247, 247, 0.9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: _toggle,
                  onVerticalDragUpdate: _handleDragUpdate,
                  onVerticalDragEnd: _handleDragEnd,
                  child: Container(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: screen.width * 0.1 - screen.height * 0.015,
                          backgroundImage:
                              AssetImage(provider.doctors[0].image),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                        size: 20.0,
                                      ),
                                      Text(
                                        "${provider.doctors[0].rating.toStringAsPrecision(2)}",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
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
                                            color:
                                                Colors.black.withOpacity(0.5),
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
                                            color:
                                                Colors.black.withOpacity(0.5),
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
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: (_controller.status == AnimationStatus.completed)
                      ? 1.0
                      : 0.0,
                  child: Visibility(
                    visible: (_controller.status == AnimationStatus.completed)
                        ? true
                        : false,
                    child: TableCalendar(
                      calendarController: _calendarController,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
