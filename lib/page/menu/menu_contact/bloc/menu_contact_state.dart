import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:equatable/equatable.dart';

abstract class MenuContactState extends Equatable {
  MenuContactState([List props = const []]) : super(props);
}

class MenuContactLoaded extends MenuContactState {
  final List<ContactModel> listOfContact;
  MenuContactLoaded({this.listOfContact}) : super([listOfContact]);
}

class MenuContactLoading extends MenuContactState {}

class MenuContactError extends MenuContactState {}

class MenuContactInitial extends MenuContactState {}

class MenuContactReload extends MenuContactState {}
