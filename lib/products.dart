import './screens/product.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Products(this.products) {
    print('[Products Widget] constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child:
                    Text(
                      products[index]['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                        fontFamily: 'Oswald'),
                    )
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      '\$${products[index]['price'].toString()}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
            child: Text('Union Square, San Francisto'),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius:  BorderRadius.circular(6.0)
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('details'),
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString()),
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
