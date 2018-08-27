import './create_product.dart';
import './list_product.dart';

import './products.dart';
import 'package:flutter/material.dart';

class ProductAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  AppBar(
                    automaticallyImplyLeading: false,
                    title: Text('Choose'),
                  ),
                  ListTile(
                    title: Text('Products'),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ProductsScreen())),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: Text('Product Admin'),
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.create),text: 'Create Product',),
                Tab(icon: Icon(Icons.list),text: 'My Products',),
              ]),
            ),
            body: TabBarView(children: [
              ProductCreateTab(),
              ProductListTab()
            ])));
  }
}
