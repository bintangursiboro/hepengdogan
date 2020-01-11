import 'package:contact_app/page/menu/menu_contact/menu_contact_view.dart';
import 'package:flutter/material.dart';

class MenuContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuContactState();
  }
}

class _MenuContactState extends State<MenuContact> {
  @override
  Widget build(BuildContext context) {
    return MenuContactView(
      addContact: () {},
      listContactModel: [],
      showOptions: () {},
    );
  }
}
