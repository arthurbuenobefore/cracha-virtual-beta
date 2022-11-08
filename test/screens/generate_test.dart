import 'package:cracha_virtual_beta/screens/generate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  testWidgets('A QRCode should be created', (tester) async {
    const url = 'http://localhost:8080/api';
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: Generate(url: url)),
    ));

    final qrCodeField = find.byType(QrImage);
    expect(qrCodeField, findsOneWidget);
  });
}
