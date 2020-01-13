import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:flutter/material.dart';

class MenuContactView extends StatelessWidget {
  final List<ContactModel> listContactModel;
  final VoidCallback addContact;
  final VoidCallback showOptions;
  final bool isLoading;

  MenuContactView({
    this.isLoading,
    this.addContact,
    this.listContactModel,
    this.showOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container();
        },
        itemCount: listContactModel.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addContact,
        child: Icon(Icons.add),
      ),
    );
  }
}
