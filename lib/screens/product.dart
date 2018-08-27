import 'dart:async';

import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String productText;
  final String productImage;

  ProductScreen(this.productText, this.productImage);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(productImage),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(productText),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Delete'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ),
        ],
      )
    ), onWillPop: () {
      print('back button pressed');
      Navigator.pop(context,false);
      return Future.value(false);
    },);
  }

}