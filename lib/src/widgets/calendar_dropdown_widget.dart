import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/src/provider/doctors_provider.dart';
import 'package:medical_app/src/widgets/hour_menu_widget.dart';
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
  int _selectedMainPage = 0;

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
            width: double.infinity,
            height: lerp(minHeight, maxHeight),
            decoration: BoxDecoration(
              color: Color.fromRGBO(247, 247, 247, 1.0),
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
            child: Stack(
              children: <Widget>[
                NewAppointmentMapHeaderWidget(
                  fontSize: headerFontSize,
                  topMargin: headerTopMargin,
                  leftPadding: 32,
                  rightPadding: 32,
                  toggle: _toggle,
                  onDragUpdate: _handleDragUpdate,
                  onDragEnd: _handleDragEnd,
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
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screen.height * 0.13,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                TableCalendar(
                                  calendarController: _calendarController,
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  rowHeight: screen.height * 0.055,
                                  calendarStyle: CalendarStyle(
                                    outsideDaysVisible: true,
                                    todayColor: Theme.of(context).primaryColor,
                                    holidayStyle:
                                        TextStyle().copyWith(color: Colors.red),
                                    markersColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  daysOfWeekStyle: DaysOfWeekStyle(
                                    dowTextBuilder: (date, locale) =>
                                        DateFormat.E(locale).format(date)[0],
                                    weekdayStyle:
                                        TextStyle(fontWeight: FontWeight.w700),
                                    weekendStyle:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  headerStyle: HeaderStyle(
                                    centerHeaderTitle: true,
                                    formatButtonVisible: false,
                                    formatButtonTextStyle: TextStyle().copyWith(
                                        color: Colors.white, fontSize: 15.0),
                                    formatButtonDecoration: BoxDecoration(
                                      color: Colors.deepOrange[400],
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                  builders: CalendarBuilders(
                                    selectedDayBuilder:
                                        (context, date, events) => Container(
                                      margin: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(240, 116, 176, 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Text(
                                        date.day.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    todayDayBuilder: (context, date, events) =>
                                        Container(
                                      margin: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Text(
                                        date.day.toString(),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 10.0,
                                      ),
                                      child: Text(
                                        'These times are available',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio:
                                  (((screen.height - kToolbarHeight - 24) / 2) /
                                      (screen.width / 3)),
                              crossAxisCount: 2,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                print(index);
                                return HourMenuWidget(
                                  active: _selectedMainPage == index,
                                  onTap: () {
                                    setState(() {
                                      _selectedMainPage = index;
                                    });
                                  },
                                  icon: Icons.dashboard,
                                  title:
                                      provider.doctors[0].hoursAvailable[index],
                                );
                              },
                              childCount:
                                  provider.doctors[0].hoursAvailable.length,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 10.0,
                              ),
                              child: FlatButton(
                                color: Color.fromRGBO(77, 221, 136, 1.0),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: Color.fromRGBO(77, 221, 136, 1.0),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'home');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
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
