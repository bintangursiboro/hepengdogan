import 'package:contact_app/page/menu/menu.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:contact_app/utility/env/routes.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> navigatorKey =
      InjectorContainer().getNavigationKeyHelper().navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Routes(
      initialWidget: Menu(),
      navigatorKey: navigatorKey,
    );
  }
}
