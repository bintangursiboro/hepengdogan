import 'package:contact_app/page/add_contact/bloc/add_contact_bloc.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddContactState();
  }
}

class _AddContactState extends State<AddContact> {
  AddContactBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AddContactBloc();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
