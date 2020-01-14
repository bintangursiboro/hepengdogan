import 'package:flutter/material.dart';

class AddContactView extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  AddContactView({
    this.firstNameController,
    this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Container(
          padding: const EdgeInsets.all(30.0),
          color: Colors.white,
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Text(
                    'Add Contact',
                    style: TextStyle(color: Colors.blue, fontSize: 20.0),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "First Name",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "First Name Cannot be Empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Last Name Cannot be Empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Age",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Age Cannot be Empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
