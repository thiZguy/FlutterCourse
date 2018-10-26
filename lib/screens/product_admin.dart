import './create_product.dart';
import './list_product.dart';

import 'package:flutter/material.dart';

class ProductAdminScreen extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductAdminScreen(this.addProduct, this.deleteProduct);

  Drawer _buildNavegationDrawerElement(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: _buildNavegationDrawerElement(context),
            appBar: AppBar(
              title: Text('Product Admin'),
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.create),text: 'Create Product',),
                Tab(icon: Icon(Icons.list),text: 'My Products',),
              ]),
            ),
            body: TabBarView(children: [
              ProductCreateTab(addProduct),
              ProductListTab()
            ])));
  }
}
