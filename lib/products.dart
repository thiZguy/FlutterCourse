import './screens/product.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map> products;
  final Function deleteProduct;
  Products(this.products, {this.deleteProduct}) {
    print('[Products Widget] constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('details'),
                onPressed: () => Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductScreen(
                            products[index]['title'],
                            products[index]['image']))
                ).then((bool value) {
                  if(value) {
                    deleteProduct(index);
                  }
                }),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem, itemCount: products.length)
        : Center(
            child: Text('no products found please add some'),
          );
  }
}
