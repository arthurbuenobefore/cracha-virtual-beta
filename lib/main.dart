import 'package:flutter/material.dart';

main() {
  runApp(CrachaVirtual());
}

class CrachaVirtual extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: Card(
          child: Column(
            children: <Widget>[
              Image.asset('assets/food.jpg'),
              Text('Food Paradise')
            ],
          ),
        ),
      ),
    );
  }
}
