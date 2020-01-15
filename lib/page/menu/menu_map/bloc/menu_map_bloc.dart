import 'package:bloc/bloc.dart';
import 'package:contact_app/page/menu/menu_map/bloc/menu_map_event.dart';
import 'package:contact_app/page/menu/menu_map/bloc/menu_map_state.dart';
import 'package:contact_app/page/menu/menu_map/map_util.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MenuMapBloc extends Bloc<MenuMapEvent, MenuMapState> {
  final Set<Marker> _marker = {};
  final Set<Polyline> _polyline = {};
  final MapUtil mapUtil = MapUtil();

  @override
  MenuMapState get initialState => MenuMapInitial();

  @override
  Stream<MenuMapState> mapEventToState(MenuMapEvent event) async* {
    if (event is InitializeMap) {
      yield MenuMapLoading();
      try {
        List<List<LatLng>> listAfterInit =
            await initListOfRoutes(event.listOfCoord);
        initSetOfMarker(event.listOfCoord);
        initSetOfPolyline(listAfterInit);
        yield MenuMapLoaded(
            listOfRoutes: listAfterInit, marker: _marker, polyline: _polyline);
      } catch (_) {
        yield MenuMapError();
      }
    }
  }

  void initSetOfMarker(List<LatLng> listLatLng) {
    for (int i = 0; i < listLatLng.length; i++) {
      _marker.add(
        Marker(
          markerId: MarkerId('marker$i'),
          position: listLatLng[i],
        ),
      );
    }
  }

  void initSetOfPolyline(List<List<LatLng>> listOfLatLng) {
    for (int i = 0; i < listOfLatLng.length; i++) {
      _polyline.add(
        Polyline(
          polylineId: PolylineId('polyline$i'),
          visible: true,
          points: listOfLatLng[i],
          width: 7,
          color: Colors.blue,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap,
        ),
      );
    }
  }

  Future<List<List<LatLng>>> initListOfRoutes(
      List<LatLng> listCoordinatePoint) async {
    List<List<LatLng>> listOfRoutes = [];

    for (int i = 0; i < listCoordinatePoint.length - 1; i++) {
      listOfRoutes.add(await mapUtil.getSomePoints(
          listCoordinatePoint[0], listCoordinatePoint[i + 1]));
    }
    return listOfRoutes;
  }
}
