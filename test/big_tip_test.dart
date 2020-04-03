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
  testWidgets('Correct pull of default icon settings', (tester) async {
    final BigTip _bigTip = BigTip(
      child: Icon(Icons.cake),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Expecting default cake icon & theme
    expect(find.byIcon(Icons.cake), findsOneWidget);
    final iconTheme = tester.widget<IconTheme>(
      find
          .ancestor(
            of: find.byIcon(Icons.cake),
            matching: find.byType(IconTheme),
          )
          .first,
    );
    expect(iconTheme.data.size, 100);
    expect(iconTheme.data.color, Color(0x8a000000));
  });

  testWidgets('Using a custom icon with custom properties', (tester) async {
    final BigTip _bigTip = BigTip(
      child: Icon(
        Icons.cake,
        size: 50,
        color: Colors.red,
      ),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Expecting default cake icon & theme
    expect(find.byIcon(Icons.cake), findsOneWidget);
    final icon = tester.widget<Icon>(find.byIcon(Icons.cake));
    expect(icon.size, 50);
    expect(icon.color, Colors.red);
  });

  testWidgets('Correct pull of default title settings', (tester) async {
    final BigTip _bigTip = BigTip(
      title: Text('title'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Expecting default title text & theme
    expect(find.text('title'), findsOneWidget);
    final defaultTextStyle = tester.widget<DefaultTextStyle>(
      find
          .ancestor(
            of: find.text('title'),
            matching: find.byType(DefaultTextStyle),
          )
          .first,
    );
    expect(defaultTextStyle.style.color, Color(0xdd000000));
    expect(defaultTextStyle.style.fontSize, 20);
    expect(defaultTextStyle.style.fontWeight, FontWeight.w500);
  });

  testWidgets(
    'Using a custom title text widget with custom properties',
    (tester) async {
      final BigTip _bigTip = BigTip(
        title: Text(
          'title',
          style: TextStyle(
            fontSize: 25,
            color: Colors.red,
          ),
        ),
      );

      await tester.pumpWidget(
        TestPage(_bigTip),
      );

      // Expecting custom title text & theme
      expect(find.text('title'), findsOneWidget);
      final text = tester.widget<Text>(find.text('title'));
      expect(text.style.color, Colors.red);
      expect(text.style.fontSize, 25);
    },
  );

  testWidgets('Correct pull of default subtitle settings', (tester) async {
    final BigTip _bigTip = BigTip(
      subtitle: Text('subtitle'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Expecting default subtitle text & theme
    expect(find.text('subtitle'), findsOneWidget);
    final defaultTextStyle = tester.widget<DefaultTextStyle>(
      find
          .ancestor(
            of: find.text('subtitle'),
            matching: find.byType(DefaultTextStyle),
          )
          .first,
    );
    expect(defaultTextStyle.style.color, Color(0xdd000000));
    expect(defaultTextStyle.style.fontSize, 16);
    expect(defaultTextStyle.style.fontWeight, FontWeight.w400);
  });

  testWidgets(
    'Using a custom subtitle text widget with custom properties',
    (tester) async {
      final BigTip _bigTip = BigTip(
        subtitle: Text(
          'subtitle',
          style: TextStyle(
            fontSize: 15,
            color: Colors.red,
          ),
        ),
      );

      await tester.pumpWidget(
        TestPage(_bigTip),
      );

      // Expecting custom subtitle text & theme
      expect(find.text('subtitle'), findsOneWidget);
      final text = tester.widget<Text>(find.text('subtitle'));
      expect(text.style.color, Colors.red);
      expect(text.style.fontSize, 15);
    },
  );

  testWidgets(
    'Correct pull of default action widget settings',
    (tester) async {
      final BigTip _bigTip = BigTip(
        child: Icon(Icons.cake),
        action: Text('action'),
        actionCallback: () => null,
      );

      await tester.pumpWidget(
        TestPage(_bigTip),
      );

      // Expecting default action text & theme
      expect(find.text('action'), findsOneWidget);
      final button = tester.widget<FlatButton>(find.ancestor(
        of: find.text('action'),
        matching: find.byType(FlatButton),
      ));
      expect(button.textColor, Color(0xff2196f3));
    },
  );

  testWidgets(
    'Using a custom action text widget with custom properties',
    (tester) async {
      final BigTip _bigTip = BigTip(
        child: Icon(Icons.cake),
        action: Text(
          'action',
          style: TextStyle(color: Colors.red),
        ),
        actionCallback: () => null,
      );

      await tester.pumpWidget(
        TestPage(_bigTip),
      );

      // Expecting custom action text & theme
      expect(find.text('action'), findsOneWidget);
      final button = tester.widget<FlatButton>(find.ancestor(
        of: find.text('action'),
        matching: find.byType(FlatButton),
      ));
      expect(button.textColor, Colors.red);
    },
  );

  testWidgets('User can activate action callback correctly', (tester) async {
    bool _pressed = false;
    final BigTip _bigTip = BigTip(
      child: Icon(Icons.cake),
      action: Text('action'),
      actionCallback: () => _pressed = true,
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Presses the action button
    await tester.tap(find.text('action'));
    expect(_pressed, true);
  });

  testWidgets('Testing action widget disable capabilities', (tester) async {
    bool _pressed = false;
    final BigTip _bigTip = BigTip(
      child: Icon(Icons.cake),
      action: Text('action'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Presses the disabled action button
    await tester.tap(find.text('action'));
    expect(_pressed, false);
  });

  testWidgets('Applies padding by default', (tester) async {
    final BigTip _bigTip = BigTip(
      child: Icon(Icons.cake),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Expecting default padding (32)
    final padding = tester.widget<Padding>(find.ancestor(
      of: find.byIcon(Icons.cake),
      matching: find.byType(Padding),
    ));
    expect(padding.padding, EdgeInsets.all(32));
  });

  testWidgets(
    'Applies custom padding properties corerctly',
    (tester) async {
      final BigTip _bigTip = BigTip(
        padding: EdgeInsets.all(16),
        child: Icon(Icons.cake),
      );

      await tester.pumpWidget(
        TestPage(_bigTip),
      );

      // Expecting default padding (32)
      final padding = tester.widget<Padding>(find.ancestor(
        of: find.byIcon(Icons.cake),
        matching: find.byType(Padding),
      ));
      expect(padding.padding, EdgeInsets.all(16));
    },
  );

  testWidgets('Applies child space by default', (tester) async {
    final BigTip _bigTip = BigTip(
      child: Icon(Icons.cake),
      title: Text('title'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Expecting default child space (22)
    final childSpace = tester.widget<SizedBox>(
      find
          .descendant(
            of: find.byType(BigTip),
            matching: find.byType(SizedBox),
          )
          .at(1),
    );
    expect(childSpace.height, 22);
  });

  testWidgets(
    'Applies custom child space properties corerctly',
    (tester) async {
      final BigTip _bigTip = BigTip(
        space: 16,
        child: Icon(Icons.cake),
        title: Text('title'),
      );

      await tester.pumpWidget(
        TestPage(_bigTip),
      );

      // Expecting default child space (22)
      final childSpace = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(BigTip),
              matching: find.byType(SizedBox),
            )
            .at(1),
      );
      expect(childSpace.height, 16);
    },
  );

  testWidgets('Applies text space by default', (tester) async {
    final BigTip _bigTip = BigTip(
      title: Text('title'),
      subtitle: Text('subtitle'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Expecting default child space (22)
    final childSpace = tester.widget<SizedBox>(
      find.descendant(
        of: find.byType(BigTip),
        matching: find.byType(SizedBox),
      ),
    );
    expect(childSpace.height, 8);
  });

  testWidgets(
    'Applies custom subtitle space properties corerctly',
    (tester) async {
      final BigTip _bigTip = BigTip(
        subtitleSpace: 12,
        title: Text('title'),
        subtitle: Text('subtitle'),
      );

      await tester.pumpWidget(
        TestPage(_bigTip),
      );

      // Expecting default child space (22)
      final childSpace = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(BigTip),
          matching: find.byType(SizedBox),
        ),
      );
      expect(childSpace.height, 12);
    },
  );

  testWidgets('Renders child-only layout', (tester) async {
    final BigTip _bigTip = BigTip(
      child: Icon(Icons.cake),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Finds only the SizedBox containing the icon itself
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('Renders title-only layout', (tester) async {
    final BigTip _bigTip = BigTip(
      title: Text('title'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Finds no separator
    expect(find.byType(SizedBox), findsNothing);
  });

  testWidgets('Renders subtitle-only layout', (tester) async {
    final BigTip _bigTip = BigTip(
      subtitle: Text('subtitle'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Finds no separator
    expect(find.byType(SizedBox), findsNothing);
  });

  testWidgets('Renders child-and-title-only layout', (tester) async {
    final BigTip _bigTip = BigTip(
      child: Icon(Icons.cake),
      title: Text('title'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Finds the Icon child and its separator
    expect(find.byType(SizedBox), findsNWidgets(2));
  });

  testWidgets('Renders child-and-subtitle-only layout', (tester) async {
    final BigTip _bigTip = BigTip(
      child: Icon(Icons.cake),
      subtitle: Text('subtitle'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Finds the Icon child and its separator
    expect(find.byType(SizedBox), findsNWidgets(2));
  });

  testWidgets('Renders title-and-subtitle-only layout', (tester) async {
    final BigTip _bigTip = BigTip(
      title: Text('title'),
      subtitle: Text('subtitle'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Finds only the text spacer widget
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('Renders with action correctly', (tester) async {
    final BigTip _bigTip = BigTip(
      title: Text('title'),
      action: Text('Action'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Finds only the text spacer widget
    expect(find.byType(Flexible), findsNWidgets(2));
  });

  testWidgets('Renders without action correctly', (tester) async {
    final BigTip _bigTip = BigTip(
      title: Text('title'),
      subtitle: Text('subtitle'),
    );

    await tester.pumpWidget(
      TestPage(_bigTip),
    );

    // Finds only the text spacer widget
    expect(find.byType(Flexible), findsNothing);
  });
}
