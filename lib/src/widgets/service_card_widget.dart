import 'package:flutter/material.dart';
import 'package:medical_app/src/provider/services_provider.dart';
import 'package:medical_app/src/widgets/service_card_content_widget.dart';
import 'package:provider/provider.dart';

class ServiceCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServicesProvider>(context);

    final screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: screen.height * 0.25,
      child: ListView.builder(
        itemCount: provider.size,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(right: 7.0),
            child: ServiceCardContentWidget(
              color: provider.colors[index],
              icon: provider.icons[index],
              title: provider.title[index],
              subtitle: provider.subtitle[index],
            ),
          );
        },
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15.0),
      ),
    );
  }
}
