import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:big_tip/big_tip.dart';

class TestPage extends StatelessWidget {
  final Widget test;

  const TestPage(this.test);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('AppBar'),
          ),
          body: test,
        ),
      ),
    );
  }
}

void main() {
  testWidgets('Correct pull of default icon settings', (tester) async {});

  testWidgets('Using a custom icon with custom properties', (tester) async {});

  testWidgets('Correct pull of default title settings', (tester) async {});

  testWidgets(
    'Using a custom title text widget with custom properties',
    (tester) async {},
  );

  testWidgets('Correct pull of default subtitle settings', (tester) async {});

  testWidgets(
    'Using a custom subtitle text widget with custom properties',
    (tester) async {},
  );

  testWidgets(
    'Correct pull of default action widget settings',
    (tester) async {},
  );

  testWidgets(
    'Using a custom action text widget with custom properties',
    (tester) async {},
  );

  testWidgets('User can activate action callback correctly', (tester) async {});

  testWidgets('Testing action widget disable capabilities', (tester) async {});

  testWidgets('Applies padding by default', (tester) async {});

  testWidgets(
    'Applies custom padding properties corerctly',
    (tester) async {},
  );

  testWidgets('Applies child space by default', (tester) async {});

  testWidgets(
    'Applies custom child space properties corerctly',
    (tester) async {},
  );

  testWidgets('Applies text space by default', (tester) async {});

  testWidgets(
    'Applies custom text space properties corerctly',
    (tester) async {},
  );

  testWidgets('Renders child-only layout', (tester) async {});

  testWidgets('Renders titleonly layout', (tester) async {});

  testWidgets('Renders subtitle-only layout', (tester) async {});

  testWidgets('Renders child-and-title-only layout', (tester) async {});

  testWidgets('Renders child-and-subtitle-only layout', (tester) async {});

  testWidgets('Renders title-and-subtitle-only layout', (tester) async {});
}
