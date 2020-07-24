import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapWidget extends StatefulWidget {
  final double topMargin;
  final double leftMargin;
  final bool isVisible;
  final double borderRadius;

  MapWidget({
    Key key,
    this.leftMargin,
    this.topMargin,
    this.isVisible,
    this.borderRadius,
  }) : super(key: key);
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Positioned(
      top: widget.topMargin,
      left: widget.leftMargin,
      right: 0,
      height: screen.height,
      child: AnimatedOpacity(
        opacity: (widget.isVisible) ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: FlutterMap(
            options: new MapOptions(
              center: new LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(51.5, -0.09),
                    builder: (ctx) => new Container(
                      child: new FlutterLogo(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
