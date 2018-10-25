import 'package:flutter/material.dart';
import 'package:f_test_mac/widgets/products/products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products){
    print('[ProductManager Widget] constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [
        Expanded(
          child:
            Products(products),
        ),
      ],
    );
  }
}
