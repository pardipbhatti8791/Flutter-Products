import 'package:flutter/material.dart';
import 'product_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GpList'),
          backgroundColor: Colors.pink,
        ),
        body: ProductManager('Gugu Tester')
      ),
    );
  }
}
