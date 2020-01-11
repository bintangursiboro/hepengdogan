import 'package:contact_app/page/menu/menu.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final Widget initialWidget;
  final GlobalKey<NavigatorState> navigatorKey;

  Routes({
    @required this.initialWidget,
    @required this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: Menu.PATH,
      routes: <String, WidgetBuilder>{
        Menu.PATH: (_) => Menu(),
      },
      title: 'Uang Teman Challenge',
    );
  }
}
