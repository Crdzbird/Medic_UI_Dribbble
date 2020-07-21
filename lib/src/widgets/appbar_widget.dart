import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget();
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: screen.width * 0.1 - screen.height * 0.015,
            backgroundImage: AssetImage('assets/images/pollo_asustado.jpg'),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.20),
                        blurRadius: 0.5,
                        offset: Offset.fromDirection(13),
                      )
                    ]),
                child: IconButton(
                  color: Color.fromRGBO(0, 0, 0, 0.20),
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  iconSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.more_vert,
            size: 40,
            color: Color.fromRGBO(0, 0, 0, 0.20),
          ),
        ],
      ),
    );
  }
}
