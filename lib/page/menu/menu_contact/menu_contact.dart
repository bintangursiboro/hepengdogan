import 'package:contact_app/page/add_contact/add_contact.dart';
import 'package:contact_app/page/menu/menu_contact/bloc/menu_contact_bloc.dart';
import 'package:contact_app/page/menu/menu_contact/bloc/menu_contact_event.dart';
import 'package:contact_app/page/menu/menu_contact/bloc/menu_contact_state.dart';
import 'package:contact_app/page/menu/menu_contact/menu_contact_view.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuContactState();
  }
}

class _MenuContactState extends State<MenuContact> {
  MenuContactBloc _bloc;

  @override
  void initState() {
    _bloc = MenuContactBloc();
    _bloc.add(GetMenuContact());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, MenuContactState state) {
        return MenuContactView(
          addContact: addContact,
          listContactModel:
              (state is MenuContactLoaded) ? state.listOfContact : [],
          onDeleteItem: onDeleteItem,
        );
      },
    );
  }

  VoidCallback addContact = () {
    InjectorContainer()
        .getNavigationKeyHelper()
        .navigateToNamed(AddContact.PATH);
  };

  void onDeleteItem(String id) {
    _bloc.add(DeleteContact(id: id));
  }
}
