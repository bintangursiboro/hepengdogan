import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:contact_app/page/menu/menu_map/menu_map_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MenuMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuMapState();
  }
}

class _MenuMapState extends State<MenuMap> {
  onMapCreated(GoogleMapController controller) {}

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = Set();
  Set<Polyline> _polylines = Set();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey = 'AIzaSyBd0juddKHjBvz3m2xL6KfWkGMaAXGnaJY';

  @override
  Widget build(BuildContext context) {
    return MenuMapView(
        // onMapCreated: onMapCreated,
        );
  }
}
