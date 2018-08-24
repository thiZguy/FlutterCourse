import 'package:f_test_mac/products_manager.dart';
import 'package:f_test_mac/screens/home.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled = true;
//  debugPaintBaselinesEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.deepPurpleAccent),
        home: HomeScreen(),
    );
  }
}
