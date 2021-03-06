import 'package:f_test_mac/screens/product.dart';
import 'package:f_test_mac/screens/product_admin.dart';

import './screens/auth.dart';
import 'package:f_test_mac/screens/products.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled = true;
//  debugPaintBaselinesEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      accentColor: Colors.blueAccent,
      buttonColor: Colors.lightBlue
    ),
//        home: AuthScreen(),
    routes: {
      '/': (BuildContext context) => AuthScreen(),
      '/admin': (BuildContext context) =>
          ProductAdminScreen(_addProduct, _deleteProduct),
      '/products': (BuildContext context) => ProductsScreen(_products),
    },
    onGenerateRoute: (RouteSettings settings) {
      final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductScreen(
                  _products[index]['title'], _products[index]['image'], _products[index]['description'], _products[index]['price'],));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsScreen(_products));
      },
    );
  }

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      print(product);
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }
}
