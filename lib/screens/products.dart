import 'package:flutter/material.dart';
import 'package:f_test_mac/products_manager.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Test'),
      ),
      body: ProductManager()
    );
  }

}