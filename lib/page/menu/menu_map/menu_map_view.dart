import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MenuMapView extends StatelessWidget {
  final Function(GoogleMapController) onMapCreated;
  final Set<Polyline> setPolyline;
  final Set<Marker> setMarker;
  final bool isLoading;
  final bool isError;

  MenuMapView({
    this.onMapCreated,
    this.setPolyline,
    this.setMarker,
    this.isError,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return (isError)
        ? Container(
            child: Text('Maaf Terjadi Kesalahan'),
          )
        : ((isLoading)
            ? Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading Map'),
                  ],
                ),
              )
            : Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: onMapCreated,
                    markers: setMarker,
                    polylines: setPolyline,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(-6.214535, 106.823185),
                      zoom: 16,
                    ),
                    mapType: MapType.normal,
                  )
                ],
              ));
  }
}
