import 'package:flutter/material.dart';

class HourMenuWidget extends StatelessWidget {
  const HourMenuWidget({this.active, this.icon, this.title, this.onTap});
  final bool active;
  final IconData icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 13),
        decoration: BoxDecoration(
          color: active
              ? Color.fromRGBO(241, 115, 176, 1.0)
              : Color.fromRGBO(233, 233, 233, 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? "",
              style: TextStyle(
                color: active ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
