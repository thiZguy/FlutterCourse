import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/ui/title_default.dart';

class ProductScreen extends StatelessWidget {
  final String productText;
  final String productImage;
  final String productDescription;
  final double productPrice;
  ProductScreen(this.productText, this.productImage, this.productDescription,
      this.productPrice);

  Widget _buildProductPriceAddress () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '\$${productPrice.toString()}',
          style: TextStyle(
            color: Colors.lightBlue, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic, fontSize: 16.0),
        ),
        Text('|', style: TextStyle(color: Colors.grey),),
        Text('Union Square, San Franscico', style: TextStyle(color: Colors.grey, fontFamily: 'Oswald'),),
      ],);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text(productText),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(productImage),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                constraints: BoxConstraints(maxHeight: 200.0, maxWidth: 500.0, minHeight: 150.0, minWidth: 350.0),
                padding: EdgeInsets.all(10.0),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 0.2),
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2.0, 3.0),
                          blurRadius: 0.55),
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 5.0),
                          blurRadius: 0.9),
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: TitleDefault(productText),
                    ),
                    Text(
                      productDescription,
                      style: TextStyle(color: Colors.black54, fontSize: 18.0),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 60.0,),
                        _buildProductPriceAddress()
                      ]
                    ),
                  ],
                ),
              ),
//              Container(
//                margin: EdgeInsets.only(top: 50.0, right: 300.0, bottom: 30.0),
//                child: RaisedButton.icon(
//                  label: Text('Delete'),
//                  color: Colors.white,
//                  icon: Icon(Icons.delete),
//                  textColor: Colors.red,
//                  onPressed: () => _showWarningDialog(context),
//                ),
//              ),
            ],
          )),
      onWillPop: () {
        print('back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}
