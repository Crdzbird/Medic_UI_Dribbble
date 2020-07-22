import 'package:flutter/material.dart';
import 'package:medical_app/src/widgets/title_widget.dart';

class ListTileWidget extends StatelessWidget {
  final String leadingText;
  final String trailingText;
  final Color leadingColor;
  final Color trailingColor;
  final double leadingTextSize;
  final double trailingTextSize;
  final EdgeInsetsGeometry padding;

  ListTileWidget(
      {this.leadingText,
      this.leadingColor,
      this.leadingTextSize,
      this.trailingText,
      this.trailingColor,
      this.trailingTextSize,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: (padding != null) ? padding : EdgeInsets.zero,
      leading: TitleWidget(
        title: leadingText,
        size: leadingTextSize,
        requiredContainer: false,
      ),
      trailing: Text(
        trailingText,
        style: TextStyle(
          color: trailingColor,
          fontWeight: FontWeight.w700,
          fontSize: trailingTextSize,
        ),
      ),
    );
  }
}
