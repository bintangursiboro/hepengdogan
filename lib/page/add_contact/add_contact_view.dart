import 'package:contact_app/page/add_contact/camera_view/camera_screen.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:contact_app/widget/component.dart';
import 'package:flutter/material.dart';

class AddContactView extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController ageController;
  final bool isLoading;
  final bool isError;
  final VoidCallback onSubmitContact;

  AddContactView({
    this.firstNameController,
    this.lastNameController,
    this.ageController,
    this.isLoading,
    this.isError,
    this.onSubmitContact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: (isError)
          ? Center(
              child: Text('Terjadi Kesalahan, Coba Lagi'),
            )
          : Container(
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
                        controller: firstNameController,
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
                        controller: lastNameController,
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
                        controller: ageController,
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
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      TextFormField(
                        enabled: false,
                        initialValue: 'N/A',
                        decoration: InputDecoration(
                          labelText: "Photo Url",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      (isLoading)
                          ? CircularProgressIndicator()
                          : NewButton(
                              onPressed: onSubmitContact,
                            )
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera,
          color: Colors.white,
        ),
        onPressed: () {
          InjectorContainer()
              .getNavigationKeyHelper()
              .navigateToNamed(CameraScreen.PATH);
        },
      ),
    );
  }
}
