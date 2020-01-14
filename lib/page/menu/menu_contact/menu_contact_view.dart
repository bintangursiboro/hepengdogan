import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:contact_app/page/menu/menu_contact/menu_item/menu_item_view.dart';
import 'package:flutter/material.dart';

class MenuContactView extends StatelessWidget {
  final List<ContactModel> listContactModel;
  final VoidCallback addContact;
  final bool isLoading;
  final Function(String) onDeleteItem;

  MenuContactView({
    this.isLoading,
    this.addContact,
    this.listContactModel,
    this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading)
          ? Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text(
                      'Loading data..',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MenuItemView(
                  onDeleteItem: onDeleteItem,
                  contactModel: listContactModel[index],
                );
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
