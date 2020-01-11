import 'package:contact_app/utility/di/injector_container.dart';
import 'package:contact_app/utility/env/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  final Widget initialWidget;

  App({this.initialWidget});

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
    return MultiBlocProvider(
      child: Routes(
        initialWidget: widget.initialWidget,
        navigatorKey: navigatorKey,
      ),
      providers: <BlocProvider>[],
    );
  }
}
