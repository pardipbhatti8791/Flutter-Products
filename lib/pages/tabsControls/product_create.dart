import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descValue = '';
  double _priceValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildBottomSheet() {
    return Center(
      child: RaisedButton(
        child: Text('Save'),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Text('This is a modal'),
                );
              });
        },
      ),
    );
  }

  Widget _buildTextFeild() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Title',
      ),
      validator: (String value) {
        if(value.isEmpty || value.length < 5 ) {
          return 'Title is required and should be 5+ character';
        }
      },
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Description',
      ),
      validator: (String value) {
        if(value.isEmpty || value.length < 5 ) {
          return 'Description is required and should be 10+ character';
        }
      },
      maxLines: 4,
      onSaved: (String value) {
        setState(() {
          _descValue = value;
        });
      },
    );
  }

  Widget _buildPriceField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Price',
      ),
      validator: (String value) {
        if(value.isEmpty || !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value) ) {
          return 'Price is required and should be number only';
        }
      },
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  _submitForm() {
    if(!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2.0),
            children: <Widget>[
              _buildTextFeild(),
              _buildDescriptionField(),
              _buildPriceField(),
              SwitchListTile(
                value: true,
                onChanged: (bool value) {},
                title: Text('Accept Terms'),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
