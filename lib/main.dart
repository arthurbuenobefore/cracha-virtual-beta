import 'package:flutter/material.dart';
import 'package:cracha_virtual_beta/screens/form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CrachaVirtualApp(),
    );
  }
}

class CrachaVirtualApp extends StatelessWidget {
  const CrachaVirtualApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: MyCustomForm()),
    );
  }
}
