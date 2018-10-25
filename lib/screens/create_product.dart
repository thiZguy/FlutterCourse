import 'package:flutter/material.dart';

class ProductCreateTab extends StatefulWidget {
  final Function addProduct;

  ProductCreateTab(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return ProductCreateState();
  }

}

class ProductCreateState extends State<ProductCreateTab> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _price;

  Widget _buildProductTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildProductDescriptionTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 4,
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildProductPriceTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(() {
          _price = double.parse(value);
        });
      },
    );
  }

  void _submitForm(){
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _price,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child:ListView(
        children: <Widget>[
          _buildProductTitleTextField(),
          _buildProductDescriptionTextField(),
          _buildProductPriceTextField(),
          SizedBox(height: 10.0,),
          RaisedButton(
            child: Text('Save'),
            textColor: Colors.white,
            color: Theme.of(context).accentColor,
            onPressed: _submitForm,
          )
        ],
      )
    );
  }
}
