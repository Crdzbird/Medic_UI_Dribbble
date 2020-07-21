import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/src/models/services.dart';

class ServicesProvider extends ChangeNotifier {
  final colors = [Colors.greenAccent, Colors.redAccent, Colors.pinkAccent];
  final icons = [Icons.home, Icons.camera_alt, Icons.chat_bubble_outline];
  final title = ['Home Visit', 'Video call', ' Chats'];
  final subtitle = ['Accurate result', 'Face to face', 'Easy & efficient'];

  List<Services> _services = new List();
  int _size = 0;

  ServicesProvider() {
    _loadServices();
  }

  List<Services> get services => _services;

  int get size => _size;

  _loadServices() {
    for (var i = 0; i < 3; i++) {
      this._services.add(
            new Services(
                title: title[i],
                subtitle: subtitle[i],
                color: colors[i],
                icon: icons[i]),
          );
    }

    this._size = this._services.length;
  }
}
