import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medical_app/src/models/doctors.dart';
import 'package:medical_app/src/provider/doctors_provider.dart';
import 'package:medical_app/src/widgets/bottom_sheet_header_widget.dart';
import 'package:medical_app/src/utils/list.dart';
import 'package:provider/provider.dart';

const double minHeight = 120;
const double iconStartSize = 44;
const double iconEndSize = 120;
const double iconStartMarginTop = 36;
const double iconEndMarginTop = 80;
const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;

class MedicBottomSheetWidget extends StatefulWidget {
  @override
  _MedicBottomSheetWidgetState createState() => _MedicBottomSheetWidgetState();
}

class _MedicBottomSheetWidgetState extends State<MedicBottomSheetWidget> {
  DoctorsProvider provider;
  double initialPercentage = 0.15;

  @override
  void dispose() {
    provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<DoctorsProvider>(context);
    return Positioned(
      top: 100,
      child: DraggableScrollableSheet(
        minChildSize: initialPercentage,
        initialChildSize: initialPercentage,
        builder: (context, scrollController) {
          return AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              double percentage = initialPercentage;
              if (scrollController.hasClients) {
                percentage = (scrollController.position.viewportDimension) /
                    (MediaQuery.of(context).size.height);
              }
              double scaledPercentage =
                  (percentage - initialPercentage) / (1 - initialPercentage);
              return Container(
                padding: const EdgeInsets.only(left: 32),
                decoration: const BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: percentage == 1 ? 1 : 0,
                      child: ListView.builder(
                        padding: EdgeInsets.only(right: 32, top: 128),
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          Doctors event = provider.doctors[index % 3];
                          return MyEventItem(
                            event: event,
                            percentageCompleted: percentage,
                          );
                        },
                      ),
                    ),
                    ...provider.doctors.map((event) {
                      int index = provider.doctors.indexOf(event);
                      int heightPerElement = 120 + 8 + 8;
                      double widthPerElement =
                          40 + percentage * 80 + 8 * (1 - percentage);
                      double leftOffset = widthPerElement *
                          (index > 4 ? index + 2 : index) *
                          (1 - scaledPercentage);
                      return Positioned(
                        top: 44.0 +
                            scaledPercentage * (128 - 44) +
                            index * heightPerElement * scaledPercentage,
                        left: leftOffset,
                        right: 32 - leftOffset,
                        child: IgnorePointer(
                          ignoring: true,
                          child: Opacity(
                            opacity: percentage == 1 ? 0 : 1,
                            child: MyEventItem(
                              event: event,
                              percentageCompleted: percentage,
                            ),
                          ),
                        ),
                      );
                    }),
                    BottomSheetHeaderWidget(
                      fontSize: 14 + percentage * 8,
                      topMargin:
                          16 + percentage * MediaQuery.of(context).padding.top,
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
}

class MyEventItem extends StatelessWidget {
  final Doctors event;
  final double percentageCompleted;

  const MyEventItem({Key key, this.event, this.percentageCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Transform.scale(
        alignment: Alignment.topLeft,
        scale: 1 / 3 + 2 / 3 * percentageCompleted,
        child: SizedBox(
          height: 120,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(16),
                  right: Radius.circular(16 * (1 - percentageCompleted)),
                ),
                child: Image.asset(
                  event.image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              /*Expanded(
                child: Opacity(
                  opacity: max(0, percentageCompleted * 2 - 1),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(16)),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(8),
                    child: _buildContent(),
                  ),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Text(event.name, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            Text(
              '1 ticket',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(width: 8),
            Text(
              event.speciality,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: <Widget>[
            Icon(Icons.place, color: Colors.grey.shade400, size: 16),
            Text(
              'Science Park 10 25A',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
            )
          ],
        )
      ],
    );
  }
}
