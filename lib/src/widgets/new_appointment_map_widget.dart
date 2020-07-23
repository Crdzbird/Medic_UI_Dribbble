import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medical_app/src/provider/doctors_provider.dart';
import 'package:medical_app/src/widgets/find_nearby_doctors_widget.dart';
import 'package:medical_app/src/widgets/new_appointment_map_header_widget.dart';
import 'package:provider/provider.dart';

const double initialPercentage = 0.15;
const double maxSize = 0.8;

class NewAppointmentMapWidget extends StatefulWidget {
  @override
  _NewAppointmentMapWidgetState createState() =>
      _NewAppointmentMapWidgetState();
}

class _NewAppointmentMapWidgetState extends State<NewAppointmentMapWidget> {
  double percentage = 0.15;
  double scaledPercentage = 0.0;
  DoctorsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<DoctorsProvider>(context);
    final size = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).padding.top;
    percentage = initialPercentage;
    return Positioned.fill(
      child: DraggableScrollableSheet(
        minChildSize: initialPercentage,
        maxChildSize: maxSize,
        initialChildSize: initialPercentage,
        builder: (context, scrollController) {
          return AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              if (scrollController.hasClients)
                percentage = (scrollController.position.viewportDimension /
                    (size.height * maxSize));
              scaledPercentage = (percentage * maxSize - initialPercentage) /
                  (1 - initialPercentage);
              return Container(
                padding: EdgeInsets.only(left: 32),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(247, 247, 247, 0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: percentage == 1 ? 1 : 0,
                      child: Container(),
                    ),
                    NewAppointmentMapHeaderWidget(
                      fontSize: 14 + percentage * 2,
                      topMargin: 10 + percentage * paddingTop,
                    ),
                    FindNearbyDoctorsWidget(
                      percentage: percentage,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    provider?.dispose();
    super.dispose();
  }
}
