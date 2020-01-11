import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  static const String PATH = '/menu';

  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uang Teman Mobile Challange'),
      ),
      body: Container(),
    );
  }
}
