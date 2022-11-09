import 'package:cracha_virtual_beta/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CrachaVirtualApp has a Child', (tester) async {
    await tester.pumpWidget(const CrachaVirtualApp());

    final typeFinder = find.byType(MaterialApp);
    final iconFinder = find.byIcon(Icons.person);
    final buttonFinder = find.text('PESQUISAR');
    expect(buttonFinder, findsOneWidget);

    expect(typeFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });
}
