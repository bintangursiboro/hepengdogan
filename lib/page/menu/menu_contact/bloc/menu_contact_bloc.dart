import 'package:bloc/bloc.dart';
import 'package:contact_app/page/menu/menu_contact/bloc/menu_contact_event.dart';
import 'package:contact_app/page/menu/menu_contact/bloc/menu_contact_state.dart';
import 'package:contact_app/page/menu/menu_contact/service/menu_contact_service.dart';

class MenuContactBloc extends Bloc<MenuContactEvent, MenuContactState> {
  @override
  MenuContactState get initialState => MenuContactInitial();

  @override
  Stream<MenuContactState> mapEventToState(MenuContactEvent event) async*{
    MenuContactService service = MenuContactService();
    
    if(event is GetMenuContact){
      yield MenuContactLoading();

      try{
        yield await service.getContacts()
      }
    }
  }
}
