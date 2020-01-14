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
  @override
  Widget build(BuildContext context) {
    return MenuMapView(
        // onMapCreated: onMapCreated,
        );
  }

  onMapCreated(GoogleMapController controller) {}
}
