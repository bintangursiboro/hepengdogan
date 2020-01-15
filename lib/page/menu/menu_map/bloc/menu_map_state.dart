import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MenuMapState extends Equatable {
  MenuMapState([List props = const []]) : super(props);
}

class MenuMapInitial extends MenuMapState {}

class MenuMapLoading extends MenuMapState {}

class MenuMapError extends MenuMapState {}

class MenuMapLoaded extends MenuMapState {
  Set<Polyline> polyline = {};
  Set<Marker> marker = {};
  List<List<LatLng>> listOfRoutes = [];

  MenuMapLoaded({
    this.marker,
    this.listOfRoutes,
    this.polyline,
  }) : super([
          marker,
          listOfRoutes,
          polyline,
        ]);

  MenuMapLoaded.copyWith({
    Set<Polyline> polyline,
    Set<Marker> marker,
    List<List<LatLng>> listOfRoute,
  }) {
    this.listOfRoutes = listOfRoutes ?? this.listOfRoutes;
    this.marker = marker ?? this.marker;
    this.polyline = polyline ?? this.polyline;
  }
}
