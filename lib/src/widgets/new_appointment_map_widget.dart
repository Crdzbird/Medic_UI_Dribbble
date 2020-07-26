import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medical_app/src/provider/doctors_provider.dart';
import 'package:medical_app/src/widgets/map_widget.dart';
import 'package:medical_app/src/widgets/new_appointment_map_header_widget.dart';
import 'package:provider/provider.dart';

const double minHeight = 120;
const double iconStartSize = 44;
const double iconEndSize = 120;
const double iconStartMarginTop = 36;
const double iconEndMarginTop = 80;
const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;

class NewAppointmentMapWidget extends StatefulWidget {
  @override
  _NewAppointmentMapWidgetState createState() =>
      _NewAppointmentMapWidgetState();
}

class _NewAppointmentMapWidgetState extends State<NewAppointmentMapWidget>
    with SingleTickerProviderStateMixin {
  DoctorsProvider provider;
  AnimationController _controller;
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
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(247, 247, 247, 0.9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
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
                MapWidget(
                  isVisible: _controller.status == AnimationStatus.completed,
                  borderRadius: itemBorderRadius,
                  leftMargin: iconLeftMargin(0),
                  topMargin: iconTopMargin(0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
