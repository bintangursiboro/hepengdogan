import 'package:equatable/equatable.dart';

abstract class AddContactState extends Equatable {
  AddContactState([List props = const []]) : super(props);
}

class AddContactSuccess extends AddContactState {}

class AddContactError extends AddContactState {
  final String errorMessage;
  AddContactError({this.errorMessage}) : super([errorMessage]);
}

class AddContactInitial extends AddContactState {}

class AddContactLoading extends AddContactState {}
