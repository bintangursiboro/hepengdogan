import 'package:contact_app/app.dart';
import 'package:contact_app/init.dart';
import 'package:flutter/material.dart';

void main() async => runApp(Init(
   appBuilder: (BuildContext context, Widget initialWidget) => App(),
));
