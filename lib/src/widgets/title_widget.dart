import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final double size;
  final String title;
  final EdgeInsets edges;
  final bool requiredContainer;

  TitleWidget({this.size, this.title, this.edges, this.requiredContainer});

  @override
  Widget build(BuildContext context) {
    return (requiredContainer)
        ? Container(
            padding: (edges != null) ? edges : EdgeInsets.zero,
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color.fromRGBO(150, 150, 150, 1.0),
                        fontWeight: FontWeight.w700,
                        fontSize: size,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(150, 150, 150, 1.0),
              fontWeight: FontWeight.w700,
              fontSize: size,
            ),
          );
  }
}
