import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:permission/permission.dart';

class MapUtil {
  GoogleMapPolyline _googleMapPolyline =
      GoogleMapPolyline(apiKey: 'AIzaSyBd0juddKHjBvz3m2xL6KfWkGMaAXGnaJY');

  Future<List<LatLng>> getSomePoints(LatLng origin, LatLng destination) async {
    var permission =
        await Permission.getPermissionsStatus([PermissionName.Location]);

    if (permission[0].permissionStatus == PermissionStatus.notAgain) {
      await Permission.requestPermissions([PermissionName.Location]);
    }
    return await _googleMapPolyline.getCoordinatesWithLocation(
      destination: destination,
      mode: RouteMode.driving,
      origin: origin,
    );
  }
}
