## [0.0.1] - 2020-09-03

* This first version contains:
  * [MaterialTestApp] which simply wraps given [widgetUnderTest] as [body] of a
    [Scaffold] which is set as [home] of a [MaterialApp]
    to simplify widget tests.

  * [find.textFieldByLabelText] finder which - as its name suggest - finds all
    [TextField] widgets that have given [labelText] as [labelText] property of
    [InputDecoration] as their [decoration] property.