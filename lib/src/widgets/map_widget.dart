import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:medical_app/src/models/coordinates_location.dart';
import 'package:medical_app/src/widgets/circle_painter_widget.dart';
import 'package:provider/provider.dart';

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

class _MapWidgetState extends State<MapWidget>
    with SingleTickerProviderStateMixin {
  CoordinatesLocation locationProvider;
  MapController _mapController = MapController();
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  LatLng _setupCenter() {
    LatLng _center;
    if (locationProvider != null) {
      _mapController.onReady.then((result) => {
            _mapController.move(
              LatLng(locationProvider.latitude, locationProvider.longitude),
              18.0,
            ),
            _center = _mapController.center
          });
      return _center;
    }
    return null;
  }

  var pointsGradient = <LatLng>[
    LatLng(12.0585802, -86.2108339),
    LatLng(12.065256, -86.2126622),
    LatLng(12.0624586, -86.2104286),
  ];

  @override
  Widget build(BuildContext context) {
    locationProvider = Provider.of<CoordinatesLocation>(context);
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
            mapController: _mapController,
            options: new MapOptions(
              center: _setupCenter(),
              zoom: 13.0,
            ),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(
                markers: [
                  _currentLocation(screen),
                ],
              ),
              PolylineLayerOptions(
                polylines: [
                  Polyline(
                    points: pointsGradient,
                    strokeWidth: 4.0,
                    gradientColors: [
                      Color(0xffE40203),
                      Color(0xffFEED00),
                      Color(0xff007E2D),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Marker _currentLocation(Size screen) {
    return (locationProvider != null)
        ? Marker(
            width: 40,
            height: 40,
            point:
                LatLng(locationProvider.latitude, locationProvider.longitude),
            builder: (ctx) => new Container(
              child: new CustomPaint(
                painter: new SpritePainter(_controller),
                child: new SizedBox(
                  width: screen.width * 0.3,
                  height: screen.width * 0.3,
                ),
              ),
            ),
          )
        : Marker();
  }
}
