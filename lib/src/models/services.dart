import 'package:flutter/material.dart';

class Services {
  String title;
  String subtitle;
  IconData icon;
  Color color;

  Services({this.title, this.subtitle, this.icon, this.color});

  factory Services.fromJson(Map<String, dynamic> json) => new Services(
        title: json["title"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
      };
}
