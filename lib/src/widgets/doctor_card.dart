import 'package:flutter/material.dart';
import 'package:medical_app/src/provider/doctors_provider.dart';
import 'package:provider/provider.dart';

class DoctorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DoctorsProvider>(context);
    final screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: screen.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.size,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 15.0, right: 12.0, top: 10.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: screen.width * 0.25,
                      height: screen.height * 0.15,
                      padding:
                          EdgeInsets.only(left: 15.0, right: 20.0, top: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                            image: AssetImage(provider.doctorImage[index]),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  provider.specialities[index],
                  style: TextStyle(
                    color: Color.fromRGBO(156, 156, 156, 1.0),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
