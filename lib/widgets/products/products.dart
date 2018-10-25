import 'package:flutter/material.dart';
import './product_card.dart';
class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Products(this.products) {
    print('[Products Widget] constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return ProductCard(this.products[index],index);
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
