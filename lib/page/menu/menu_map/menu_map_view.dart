import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MenuMapView extends StatelessWidget {
  final Function(GoogleMapController) onMapCreated;

  MenuMapView({
    this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(24.142, -110.321),
            zoom: 15,
          ),
          // myLocationEnabled: true,
        )
      ],
    );
  }
}
