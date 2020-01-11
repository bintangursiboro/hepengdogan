import 'package:contact_app/page/menu/menu.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:flutter/material.dart';

class Init extends StatelessWidget {
  final Widget Function(BuildContext context, Widget initRoute) appBuilder;

  Init({
    @required this.appBuilder,
  });

  Future init() async {
    final InjectorContainer injectorContainer = InjectorContainer();
    injectorContainer.initDependencyInjection();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return appBuilder(context, Menu());
        }
        return Container();
      },
    );
  }
}
