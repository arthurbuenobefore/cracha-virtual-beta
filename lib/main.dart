import 'package:flutter/material.dart';
import 'package:cracha_virtual_beta/screens/home.dart';

void main() => runApp(const CrachaVirtualApp());

class CrachaVirtualApp extends StatelessWidget {
  const CrachaVirtualApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}
