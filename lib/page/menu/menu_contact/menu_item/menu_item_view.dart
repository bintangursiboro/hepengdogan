import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:flutter/material.dart';

class MenuItemView extends StatelessWidget {
  final ContactModel contactModel;
  final Function(String) onDeleteItem;

  MenuItemView({
    this.contactModel,
    this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24),
              ),
            ),
            child: Image.network(
              contactModel.photo,
              height: 50,
              width: 50,
            ),
          ),
          title: Text('${contactModel.firstName} ${contactModel.lastName}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Row(
            children: <Widget>[
              Text(
                'Age :${contactModel.age}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              onDeleteItem(contactModel.id);
            },
            icon: Icon(Icons.delete, color: Colors.white, size: 30.0),
          ),
        ),
      ),
    );
  }
}
