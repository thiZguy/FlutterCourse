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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildProductTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildProductDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 4,
      onSaved: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildProductPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          _price = double.parse(value);
        });
      },
    );
  }

  void _submitForm(){
    _formKey.currentState.save();
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
    final double thewidth =  MediaQuery.of(context).size.width;
    final double the1width = thewidth > 550.0 ? 500.0 : thewidth * 0.95;
    final double the2width = thewidth - the1width;
    return Container(
      margin: EdgeInsets.all(10.0),
      child:Form(
        key: _formKey,
       child: ListView(
         padding: EdgeInsets.symmetric(horizontal: the2width / 2),
         children: <Widget>[
           _buildProductTitleTextField(),
           _buildProductDescriptionTextField(),
           _buildProductPriceTextField(),
           SizedBox(height: 10.0,),
//          RaisedButton(
//            child: Text('Save'),
//            textColor: Colors.white,
//            color: Theme.of(context).accentColor,
//            onPressed: _submitForm,
//          )
           GestureDetector(
             onTap: _submitForm,
             child: Container(
               color: Colors.green,
               padding: EdgeInsets.all(10.0),
               child: Text('My Button'),
             ),
           )
         ],
       ),
      )
    );
  }
}
