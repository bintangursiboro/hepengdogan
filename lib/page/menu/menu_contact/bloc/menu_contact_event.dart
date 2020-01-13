import 'package:equatable/equatable.dart';

abstract class MenuContactEvent extends Equatable {
  MenuContactEvent([List props = const []]) : super(props);
}

class GetMenuContact extends MenuContactEvent {}
