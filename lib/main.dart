import 'package:flutter/material.dart';
import 'package:navigation_drawer/nav_drawer.dart';
import 'package:navigation_drawer/nav_drawer_colors.dart';
import 'package:navigation_drawer/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeColors(), //TabWidget или TabWidgetDrawer или ChangeColors
    );
  }
}
