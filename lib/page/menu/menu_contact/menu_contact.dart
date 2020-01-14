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
    return BlocListener(
      bloc: _bloc,
      child: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, MenuContactState state) {
          return MenuContactView(
            addContact: addContact,
            listContactModel:
                (state is MenuContactLoaded) ? state.listOfContact : [],
            onDeleteItem: onDeleteItem,
            isLoading: (state is MenuContactLoading),
          );
        },
      ),
      listener: (BuildContext context, MenuContactState state) {
        if (state is MenuContactReload) {
          print('called');
          _bloc.add(GetMenuContact());
        }
      },
    );
  }

  VoidCallback addContact = () {
    InjectorContainer()
        .getNavigationKeyHelper()
        .navigateToNamed(AddContact.PATH);
  };

  void onDeleteItem(String id) {
    print('delete id: $id');
    _bloc.add(DeleteContact(id: id));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
