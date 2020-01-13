import 'package:equatable/equatable.dart';

abstract class MenuContactEvent extends Equatable {
  MenuContactEvent([List props = const []]) : super(props);
}

class GetMenuContact extends MenuContactEvent {}

class DeleteContact extends MenuContactEvent {
  String id;
  DeleteContact({this.id});
}
