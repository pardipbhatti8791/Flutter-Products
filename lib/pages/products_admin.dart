import 'package:flutter/material.dart';

import 'tabsControls/product_edit.dart';
import 'tabsControls/product_list.dart';

import '../models/product.dart';

class ProductsAdminPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('All Products'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/products');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Wecracy'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Create Product',
                icon: Icon(Icons.create),
              ),
              Tab(
                text: 'My Products',
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: <Widget>[
              ProductEditPage(),
              ProductListPage(null, null, null)
            ],
          ),
        ),
      ),
    );
  }
}
