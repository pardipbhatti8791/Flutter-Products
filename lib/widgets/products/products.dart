import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/products.dart';
import '../../models/product.dart';
import 'product_card.dart';

class Products extends StatelessWidget {

  // @ { Build product list }
  Widget _buildProductList(List<Product> products) {
    Widget productCard = Center(
      child: Text('No Product Found'),
    );

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, Widget child, ProductsModel model) {
      return _buildProductList(model.products);
    },);
  }
}
