import './product_admin.dart';
import 'package:flutter/material.dart';
import '../products_manager.dart';

class ProductsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductsScreen(this.products);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () => Navigator.pushReplacementNamed(
                context,
                '/admin'
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ProductManager(products)
    );
  }

}