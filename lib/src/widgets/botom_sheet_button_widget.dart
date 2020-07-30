import 'package:flutter/material.dart';

class BottomSheetButtonWidget extends StatelessWidget {
  final double percentage;
  final String title;
  final onTap tap;

  BottomSheetButtonWidget({this.title, this.percentage, this.tap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Visibility(
        visible: (percentage == 1) ? true : false,
        child: RaisedButton(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 10.0,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          color: Color.fromRGBO(77, 221, 133, 0.8),
          shape: StadiumBorder(),
          onPressed: tap,
        ),
      ),
    );
  }
}

typedef onTap = void Function();
