import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MenuMapEvent extends Equatable {
  MenuMapEvent([List props = const []]) : super(props);
}

class InitializeMap extends MenuMapEvent {
  List<LatLng> listOfCoord;

  InitializeMap({this.listOfCoord}) : super([listOfCoord]);
}
