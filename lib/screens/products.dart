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
              leading: Icon(Icons.edit),
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
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: () {})
        ],
      ),
      body: ProductManager(products)
    );
  }

}