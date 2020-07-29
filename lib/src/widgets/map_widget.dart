import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:medical_app/src/models/coordinates_location.dart';
import 'package:medical_app/src/service/openroute/openrouteservice.dart';
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
  List<LatLng> _polylines = new List();

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
              _mapController.zoom,
            ),
            _center = _mapController.center
          });
      return _center;
    }
    return null;
  }

  var points = <String>[
    '-86.2527026,12.0821092',
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
            child: FutureBuilder(
              future: _loadRoute(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      center: _setupCenter(),
                      interactive: true,
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(
                        markers: [
                          _currentLocation(screen),
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(12.0821092, -86.2527026),
                            builder: (ctx) => Icon(
                              Icons.location_on,
                              color: Color.fromRGBO(234, 82, 155, 1.0),
                            ),
                          ),
                        ],
                      ),
                      PolylineLayerOptions(
                        polylines: [
                          Polyline(
                            points: _polylines,
                            strokeWidth: 4.0,
                            color: Color.fromRGBO(234, 82, 155, 0.7),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      center: _setupCenter(),
                      interactive: true,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayerOptions(
                        markers: [
                          _currentLocation(screen),
                        ],
                      ),
                    ],
                  );
                }
              },
            )),
      ),
    );
  }

  Future<List<LatLng>> _loadRoute() async {
    if (_polylines.isEmpty) {
      print('null');
      _polylines = new List();
      var route = await OpenRouteService().getRoute(
          "${locationProvider.longitude},${locationProvider.latitude}",
          points[0]);
      route.features[0].geometry.coordinates.forEach((element) {
        _polylines.add(new LatLng(element[1], element[0]));
      });
      return _polylines;
    } else {
      return [];
    }
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
