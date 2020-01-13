import 'package:bloc/bloc.dart';
import 'package:contact_app/page/menu/menu_contact/bloc/menu_contact_event.dart';
import 'package:contact_app/page/menu/menu_contact/bloc/menu_contact_state.dart';
import 'package:contact_app/page/menu/menu_contact/service/menu_contact_service.dart';
import 'package:contact_app/utility/exception/custom_exception.dart';

class MenuContactBloc extends Bloc<MenuContactEvent, MenuContactState> {
  @override
  MenuContactState get initialState => MenuContactInitial();

  @override
  Stream<MenuContactState> mapEventToState(MenuContactEvent event) async* {
    MenuContactService service = MenuContactService();

    if (event is GetMenuContact) {
      print('Event called');
      yield MenuContactLoading();
      try {
        print('calling service');
        yield await service.getContacts().then((jsonResponse) {
          return MenuContactLoaded(listOfContact: jsonResponse);
        });
      } on UnexpectedErrorException catch (_) {
        yield MenuContactError();
      }
    }
  }
}
