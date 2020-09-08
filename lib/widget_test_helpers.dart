import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MaterialTestApp extends StatelessWidget {
  final Widget widgetUnderTest;

  const MaterialTestApp({
    Key key,
    @required this.widgetUnderTest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: widgetUnderTest,
        ),
      );
}

extension TextFieldFindersExtension on CommonFinders {
  Finder textFieldWithLabelText(final String labelText) =>
      find.byWidgetPredicate((candidate) =>
          candidate is TextField &&
          candidate.decoration.labelText == labelText);
}
