import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:permission/permission.dart';

class MenuMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuMapState();
  }
}

class _MenuMapState extends State<MenuMap> {
  GoogleMapController _controller;
  final Set<Polyline> polyline = {};
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      GoogleMapPolyline(apiKey: 'AIzaSyBd0juddKHjBvz3m2xL6KfWkGMaAXGnaJY');

  getSomePoints() async {
    var permission =
        await Permission.getPermissionsStatus([PermissionName.Location]);

    if (permission[0].permissionStatus == PermissionStatus.notAgain) {
      await Permission.requestPermissions([PermissionName.Location]);
    }
    routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
      destination: LatLng(40.6944, -73.9212),
      mode: RouteMode.driving,
      origin: LatLng(40.6782, -73.9442),
    );
  }

  @override
  void initState() {
    super.initState();
    getSomePoints();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: onCreateMap,
      polylines: polyline,
      initialCameraPosition: CameraPosition(
        target: LatLng(40.6782, -73.9442),
        zoom: 15,
      ),
      mapType: MapType.normal,
    );
  }

  void onCreateMap(GoogleMapController controller) {
    setState(() {
      _controller = controller;

      polyline.add(
        Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          points: routeCoords,
          width: 4,
          color: Colors.blue,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap,
        ),
      );
    });
  }
}
