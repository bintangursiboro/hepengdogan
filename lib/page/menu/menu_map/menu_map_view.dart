import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MenuMapView extends StatelessWidget {
  final Function(GoogleMapController) onMapCreated;
  final Set<Polyline> setPolyline;
  // final GoogleMapController controller = GoogleMapController.init(id, initialCameraPosition, googleMapState);

  MenuMapView({
    this.onMapCreated,
    this.setPolyline,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(40.6782, -73.9442),
            zoom: 15,
          ),
          polylines: setPolyline,
          onMapCreated: onMapCreated,
          myLocationEnabled: true,
        )
      ],
    );
  }
}
