import 'package:bloc/bloc.dart';
import 'package:contact_app/page/add_contact/bloc/add_contact_event.dart';
import 'package:contact_app/page/add_contact/bloc/add_contact_state.dart';
import 'package:contact_app/page/add_contact/service/add_contact_service.dart';
import 'package:contact_app/utility/exception/custom_exception.dart';

class AddContactBloc extends Bloc<AddContactEvent, AddContactState> {
  @override
  AddContactState get initialState => AddContactInitial();

  @override
  Stream<AddContactState> mapEventToState(AddContactEvent event) async* {
    AddContactService service = AddContactService();
    if (event is AddContactToService) {
      yield AddContactLoading();

      try {
        yield await service
            .saveContact(contactModel: event.contactModel)
            .then((condition) {
          if (condition) {
            return AddContactSuccess();
          }
          return AddContactError();
        });
      } on UnexpectedErrorException catch (_) {
        yield AddContactError();
      }
    }
  }
}
