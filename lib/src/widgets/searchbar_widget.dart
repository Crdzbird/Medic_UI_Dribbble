import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
      ),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(51, 141, 87, 0.4),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white60,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: InputBorder.none,
          hintText: "Search symptoms",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white60,
          ),
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.white60,
          ),
        ),
        maxLines: 1,
        controller: _searchControl,
      ),
    );
  }
}
