import 'package:flutter/material.dart';

class BottomSheetHeaderWidget extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const BottomSheetHeaderWidget(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Positioned(
      child: Container(
        height: height * 0.07,
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 247, 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Recommended Doctors',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.40),
                fontWeight: FontWeight.w700,
                fontSize: fontSize,
              ),
            ),
            SizedBox(
              width: width * 0.3,
            ),
            TextButton(
              child: Text(
                'See all',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
