import 'package:bloc/bloc.dart';
import 'package:contact_app/page/add_contact/bloc/add_contact_event.dart';
import 'package:contact_app/page/add_contact/bloc/add_contact_state.dart';

class AddContactBloc extends Bloc<AddContactEvent, AddContactState> {
  @override
  AddContactState get initialState => AddContactInitial();

  @override
  Stream<AddContactState> mapEventToState(AddContactEvent event) async* {}
}
