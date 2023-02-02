import 'package:big_tip/big_tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TestPage extends StatelessWidget {
  final Widget test;

  const TestPage(this.test, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('AppBar'),
          ),
          body: test,
        ),
      ),
    );
  }
}

void main() {
  group('Argument testing', () {
    test('check argument assertion', () {
      expect(BigTip.new, throwsAssertionError);
    });
  });

  group('Child testing', () {
    testWidgets('Correct pull of default icon settings', (tester) async {
      const bigTip = BigTip(
        child: Icon(Icons.cake),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

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
      expect(iconTheme.data.color, const Color(0x8a000000));
    });

    testWidgets('Using a custom icon with custom properties', (tester) async {
      const bigTip = BigTip(
        child: Icon(
          Icons.cake,
          size: 50,
          color: Colors.red,
        ),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.byIcon(Icons.cake), findsOneWidget);
      final icon = tester.widget<Icon>(find.byIcon(Icons.cake));
      expect(icon.size, 50);
      expect(icon.color, Colors.red);
    });
  });

  group('Title testing', () {
    testWidgets('Correct pull of default title settings', (tester) async {
      const bigTip = BigTip(
        title: Text('title'),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.text('title'), findsOneWidget);
      final defaultTextStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('title'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );
      expect(defaultTextStyle.style.color, const Color(0xdd000000));
      expect(defaultTextStyle.style.fontSize, 20);
      expect(defaultTextStyle.style.fontWeight, FontWeight.w500);
      expect(defaultTextStyle.textAlign, TextAlign.center);
    });

    testWidgets(
      'Using a custom title text widget with custom properties',
      (tester) async {
        const bigTip = BigTip(
          title: Text(
            'title',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 25,
              color: Colors.red,
            ),
          ),
        );

        await tester.pumpWidget(
          const TestPage(bigTip),
        );

        expect(find.text('title'), findsOneWidget);
        final text = tester.widget<Text>(find.text('title'));
        expect(text.style!.color, Colors.red);
        expect(text.style!.fontSize, 25);
        expect(text.textAlign, TextAlign.start);
      },
    );
  });

  group('Subtitle testing', () {
    testWidgets('Correct pull of default subtitle settings', (tester) async {
      const bigTip = BigTip(
        subtitle: Text('subtitle'),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.text('subtitle'), findsOneWidget);
      final defaultTextStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('subtitle'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );
      expect(defaultTextStyle.style.color, const Color(0xdd000000));
      expect(defaultTextStyle.style.fontSize, 16);
      expect(defaultTextStyle.style.fontWeight, FontWeight.w400);
      expect(defaultTextStyle.textAlign, TextAlign.center);
    });

    testWidgets(
      'Using a custom subtitle text widget with custom properties',
      (tester) async {
        const bigTip = BigTip(
          subtitle: Text(
            'subtitle',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 15,
              color: Colors.red,
            ),
          ),
        );

        await tester.pumpWidget(
          const TestPage(bigTip),
        );

        expect(find.text('subtitle'), findsOneWidget);
        final text = tester.widget<Text>(find.text('subtitle'));
        expect(text.style!.color, Colors.red);
        expect(text.style!.fontSize, 15);
        expect(text.textAlign, TextAlign.start);
      },
    );
  });

  group('Action widget testing', () {
    testWidgets(
      'Is correctly rendered on the screen',
      (tester) async {
        const bigTip = BigTip(
          action: Text('action'),
          child: Icon(Icons.cake),
        );

        await tester.pumpWidget(
          const TestPage(bigTip),
        );

        expect(find.text('action'), findsOneWidget);
      },
    );
  });

  group('Padding & spacing testing', () {
    testWidgets('Applies padding by default', (tester) async {
      const bigTip = BigTip(
        child: Icon(Icons.cake),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      final padding = tester.widget<Padding>(
        find.ancestor(
          of: find.byIcon(Icons.cake),
          matching: find.byType(Padding),
        ),
      );
      expect(padding.padding, const EdgeInsets.all(32));
    });

    testWidgets(
      'Applies custom padding properties corerctly',
      (tester) async {
        const bigTip = BigTip(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.cake),
        );

        await tester.pumpWidget(
          const TestPage(bigTip),
        );

        final padding = tester.widget<Padding>(
          find.ancestor(
            of: find.byIcon(Icons.cake),
            matching: find.byType(Padding),
          ),
        );
        expect(padding.padding, const EdgeInsets.all(16));
      },
    );

    testWidgets('Applies child space by default', (tester) async {
      const bigTip = BigTip(
        title: Text('title'),
        child: Icon(Icons.cake),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      final childSpace = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(BigTip),
              matching: find.byType(SizedBox),
            )
            .at(1),
      );
      expect(childSpace.height, 16);
    });

    testWidgets(
      'Applies custom child space properties corerctly',
      (tester) async {
        const bigTip = BigTip(
          childSpace: 15,
          title: Text('title'),
          child: Icon(Icons.cake),
        );

        await tester.pumpWidget(
          const TestPage(bigTip),
        );

        final childSpace = tester.widget<SizedBox>(
          find
              .descendant(
                of: find.byType(BigTip),
                matching: find.byType(SizedBox),
              )
              .at(1),
        );
        expect(childSpace.height, 15);
      },
    );

    testWidgets('Applies text space by default', (tester) async {
      const bigTip = BigTip(
        title: Text('title'),
        subtitle: Text('subtitle'),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

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
        const bigTip = BigTip(
          subtitleSpace: 12,
          title: Text('title'),
          subtitle: Text('subtitle'),
        );

        await tester.pumpWidget(
          const TestPage(bigTip),
        );

        final subtitleSpace = tester.widget<SizedBox>(
          find.descendant(
            of: find.byType(BigTip),
            matching: find.byType(SizedBox),
          ),
        );
        expect(subtitleSpace.height, 12);
      },
    );
  });

  group('Layout testing', () {
    testWidgets('Renders child-only layout', (tester) async {
      const bigTip = BigTip(
        child: Icon(Icons.cake),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('Renders title-only layout', (tester) async {
      const bigTip = BigTip(
        title: Text('title'),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.byType(SizedBox), findsNothing);
    });

    testWidgets('Renders subtitle-only layout', (tester) async {
      const bigTip = BigTip(
        subtitle: Text('subtitle'),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.byType(SizedBox), findsNothing);
    });

    testWidgets('Renders child-and-title-only layout', (tester) async {
      const bigTip = BigTip(
        title: Text('title'),
        child: Icon(Icons.cake),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.byType(SizedBox), findsNWidgets(2));
    });

    testWidgets('Renders child-and-subtitle-only layout', (tester) async {
      const bigTip = BigTip(
        subtitle: Text('subtitle'),
        child: Icon(Icons.cake),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.byType(SizedBox), findsNWidgets(2));
    });

    testWidgets('Renders title-and-subtitle-only layout', (tester) async {
      const bigTip = BigTip(
        title: Text('title'),
        subtitle: Text('subtitle'),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('Renders with action correctly', (tester) async {
      const bigTip = BigTip(
        title: Text('title'),
        action: Text('Action'),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.byType(Flexible), findsNWidgets(2));
    });

    testWidgets('Renders without action correctly', (tester) async {
      const bigTip = BigTip(
        title: Text('title'),
        subtitle: Text('subtitle'),
      );

      await tester.pumpWidget(
        const TestPage(bigTip),
      );

      expect(find.byType(Flexible), findsNothing);
    });
  });
}
