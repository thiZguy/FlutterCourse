import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {

  ProductControl();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text('Add Product', style: TextStyle(color: Colors.white),),
      onPressed: () {
//        addProduct({ 'title': 'chocolate', 'image': 'assets/food.jpg' });
      },
    );
  }

}