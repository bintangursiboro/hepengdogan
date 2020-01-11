import 'package:contact_app/app.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:flutter/material.dart';

class Init extends StatelessWidget {
  Future init() async {
    final InjectorContainer injectorContainer = InjectorContainer();
    injectorContainer.initDependencyInjection();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return App();
      },
    );
  }
}
