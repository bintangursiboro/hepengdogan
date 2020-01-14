import 'package:contact_app/page/add_contact/add_contact_view.dart';
import 'package:contact_app/page/add_contact/bloc/add_contact_bloc.dart';
import 'package:contact_app/page/add_contact/bloc/add_contact_event.dart';
import 'package:contact_app/page/add_contact/bloc/add_contact_state.dart';
import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  static const PATH = '/add-contact';
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
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    VoidCallback onSubmitContact = () {
      _bloc.add(AddContactToService(
        contactModel: ContactModel(
          age: int.parse(ageController.text.toString()),
          firstName: firstNameController.text.toString(),
          lastName: lastNameController.text.toString(),
          photo: 'N/A',
        ),
      ));
    };

    return BlocListener(
      bloc: _bloc,
      listener: (context, AddContactState state) {
        if (state is AddContactSuccess) {
          InjectorContainer().getNavigationKeyHelper().pop();
        }
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, AddContactState state) {
          return AddContactView(
            ageController: ageController,
            firstNameController: firstNameController,
            lastNameController: lastNameController,
            isError: (state is AddContactError),
            isLoading: (state is AddContactLoading),
            onSubmitContact: onSubmitContact,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
