import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medical_app/src/provider/doctors_provider.dart';
import 'package:medical_app/src/widgets/bottom_sheet_header_widget.dart';
import 'package:medical_app/src/widgets/bottom_sheet_icon_widget.dart';
import 'package:medical_app/src/widgets/find_nearby_doctors_widget.dart';
import 'package:provider/provider.dart';

const double initialPercentage = 0.15;
const double maxSize = 0.7;

class MedicBottomSheetWidget extends StatefulWidget {
  @override
  _MedicBottomSheetWidgetState createState() => _MedicBottomSheetWidgetState();
}

class _MedicBottomSheetWidgetState extends State<MedicBottomSheetWidget> {
  double percentage = 0.15;
  double scaledPercentage = 0.0005847206489196984;
  DoctorsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<DoctorsProvider>(context);
    final size = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).padding.top;
    percentage = 0.21464072325112982;
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
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          right: 32,
                          top: size.height * 0.15,
                          bottom: size.height * 0.3,
                        ),
                        controller: scrollController,
                        itemCount: provider.size,
                        itemBuilder: (context, index) {
                          return BottomSheetIconWidget(
                            doctor: provider.doctors[index],
                            percentageCompleted: percentage,
                          );
                        },
                      ),
                    ),
                    ...provider.doctors.map(
                      (doctor) {
                        int position = provider.doctors.indexOf(doctor);
                        int heightPerElement = 80 + 8 + 8;
                        double widthPerElement =
                            40 + percentage * 60 + 8 * (1 - percentage);
                        double leftOffset = widthPerElement *
                            (position > 4 ? position + 2 : position) *
                            (1 - scaledPercentage);
                        return Positioned(
                          top: 54.0 +
                              scaledPercentage * (128 - 44) +
                              position * heightPerElement * scaledPercentage,
                          left: leftOffset,
                          right: 32 - leftOffset,
                          child: IgnorePointer(
                            ignoring: true,
                            child: Opacity(
                              opacity: percentage == 1 ? 0 : 1,
                              child: BottomSheetIconWidget(
                                doctor: doctor,
                                percentageCompleted: percentage,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    BottomSheetHeaderWidget(
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
