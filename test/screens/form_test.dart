import 'package:cracha_virtual_beta/main.dart';
import 'package:cracha_virtual_beta/screens/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyCustomForm has a button and FormText', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: MyCustomForm()),
    ));

    final formTextField = find.byType(TextFormField);
    final buttonFinder = find.text('PESQUISAR');
    expect(buttonFinder, findsOneWidget);
    expect(formTextField, findsOneWidget);
  });
}
