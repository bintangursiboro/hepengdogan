import 'package:contact_app/page/menu/menu_map/bloc/menu_map_bloc.dart';
import 'package:contact_app/page/menu/menu_map/bloc/menu_map_event.dart';
import 'package:contact_app/page/menu/menu_map/bloc/menu_map_state.dart';
import 'package:contact_app/page/menu/menu_map/menu_map_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuMapState();
  }
}

class _MenuMapState extends State<MenuMap> {
  MenuMapBloc _bloc = MenuMapBloc();
  GoogleMapController _controller;
  List<LatLng> listCoordinatePoint = [
    LatLng(-6.212579, 106.822843),
    LatLng(-6.213961, 106.826689),
    LatLng(-6.210911, 106.824291),
    LatLng(-6.215762, 106.822606),
  ];

  @override
  void initState() {
    super.initState();
    _bloc.add(InitializeMap(listOfCoord: listCoordinatePoint));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, MenuMapState state) {
          return MenuMapView(
            onMapCreated: onCreateMap,
            setMarker: (state is MenuMapLoaded) ? state.marker : {},
            isError: (state is MenuMapError),
            isLoading: (state is MenuMapLoading),
            setPolyline: (state is MenuMapLoaded) ? state.polyline : {},
          );
        });
  }

  void onCreateMap(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }
}
