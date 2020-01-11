import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:equatable/equatable.dart';

class AddContactEvent extends Equatable {
  AddContactEvent([List props = const []]) : super(props);
}

class AddContactToService extends AddContactEvent {
  final ContactModel contactModel;

  AddContactToService({this.contactModel}) : super([contactModel]);
}
