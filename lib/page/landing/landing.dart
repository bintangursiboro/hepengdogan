import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  static const String PATH = '/landing';

  final Widget initialWidget;

  Landing({@required this.initialWidget});

  @override
  State<StatefulWidget> createState() {
    return _LandingState();
  }
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
