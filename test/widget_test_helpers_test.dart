import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_test_helpers/widget_test_helpers.dart';

void main() {
  group(
      '[MaterialTestApp] wraps given [sut] as [body] of a [Scaffold] inside a [MaterialApp]:',
      () {
    const suts = [
      Center(),
      TextField(),
    ];

    suts.forEach((sut) {
      testWidgets('sut: $sut', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialTestApp(widgetUnderTest: sut));

        expect(find.byType(MaterialApp), findsOneWidget);

        expect(
          find.byWidgetPredicate(
            (widget) => widget is MaterialApp && widget.home is Scaffold,
            description: 'MaterialApp -> home: Scaffold',
          ),
          findsOneWidget,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is MaterialApp &&
                widget.home is Scaffold &&
                (widget.home as Scaffold).body == sut,
            description: 'MaterialApp -> home: Scaffold -> body: $sut',
          ),
          findsOneWidget,
        );
      });
    });
  });

  group('[find.textFieldWithLabelText]', () {
    testWidgets('finds [TextField] with given [labelText]',
        (WidgetTester tester) async {
      const expectedLabelText = 'first name';
      final sut = TextField(
        decoration: InputDecoration(
          labelText: expectedLabelText,
        ),
      );

      await tester.pumpWidget(MaterialTestApp(widgetUnderTest: sut));

      expect(find.textFieldWithLabelText(expectedLabelText), findsOneWidget);
    });

    testWidgets(
        'does not find [TextField] with a different [labelText] then the given one',
        (WidgetTester tester) async {
      const expectedLabelText = 'first name';
      const actualLabelText = 'last name';
      final sut = TextField(
        decoration: InputDecoration(
          labelText: actualLabelText,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: sut,
          ),
        ),
      );

      expect(find.textFieldWithLabelText(expectedLabelText), findsNothing);
    });
  });
}
