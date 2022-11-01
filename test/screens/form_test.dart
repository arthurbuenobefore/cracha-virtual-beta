import 'package:cracha_virtual_beta/main.dart';
import 'package:cracha_virtual_beta/screens/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // testWidgets('MyCustomForm has a Scaffold', (tester) async {
  //   await tester.pumpWidget(const CrachaVirtualApp());

  //   await tester.pumpWidget(const MyCustomForm());

  //   final textFinder = find.byType(Center);
  //   //final iconFinder = find.byIcon(Icons.person);

  //   expect(textFinder, findsOneWidget);
  //   //expect(iconFinder, findsOneWidget);
  // });

  testWidgets("Flutter Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyCustomForm());
    print(tester.allRenderObjects);
    //var textField = find.byType(TextField);
    //expect(textField, findsOneWidget);
    // await tester.enterText(textField, 'Flutter Devs');
    // expect(find.text('Flutter Devs'), findsOneWidget);
    // print('Flutter Devs');
  });
}
