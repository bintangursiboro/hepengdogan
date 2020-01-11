import 'package:contact_app/page/landing/landing.dart';
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
      initialRoute: Landing.PATH,
      routes: <String, WidgetBuilder>{
        Landing.PATH: (_) => Landing(initialWidget: initialWidget),
      },
      title: 'Uang Teman Challenge',
    );
  }
}
