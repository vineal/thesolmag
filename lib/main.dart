import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'THE SOL MAG',
      home: MyHomePage(),
    );
  }
}
