# Big Tip

[![Package](https://img.shields.io/pub/v/big_tip.svg?style=for-the-badge)](https://pub.dartlang.org/packages/big_tip)
[![Build](https://img.shields.io/github/workflow/status/jesusrp98/big_tip/Flutter%20Package%20CI?style=for-the-badge)](https://github.com/jesusrp98/big_tip/actions)
[![License](https://img.shields.io/github/license/jesusrp98/big_tip.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![Patreon](https://img.shields.io/badge/Support-Patreon-orange.svg?style=for-the-badge)](https://www.patreon.com/jesusrp98)

Display information to the user using a custom layout, that can be actionable.

This package aims to provide you a simple way to communicate information to the user, using custom views and a texts message. You can also customize colors, sizes and text style.

It displays a custom widget, usually a `Icon` widget, followed by a title and a subtitle text. If the `child` widget provided is in fact an `Icon`, a default icon theme will be applied, setting its size to `100`, and using the caption text style's color to fill it.

There's also an optional action parameter, which provides the ability to call functions via a customizable button.

<p align="center">
  <img src="https://raw.githubusercontent.com/jesusrp98/big_tip/master/screenshots/0.png" width="256">
</p>

## Example

If you want to take a deeper look at the example, take a look at the [example](https://github.com/jesusrp98/big_tip/tree/master/example) folder provided with the project.

```
BigTip(
  child: Icon(Icons.cake),
  title: Text('The cake is a lie'),
  subtitle: Text('Is this a Portal reference?'),
),
```

You can also provide the user with the ability to interact with the view, via a `FlatButton` widget. To do that, you can make use of the `action` and `actionCallback` parameters of the widget. By default, this widget will be placed at the bottom of the view.

```
BigTip(
  child: Icon(Icons.cake),
  title: Text('The cake is a lie'),
  subtitle: Text('Is this a Portal reference?'),
  action: Text('CALL GABEN'),
  actionCallback: () => print('Ding dong'),
),
```

## Getting Started

This project is a starting point for a Dart [package](https://flutter.io/developing-packages/), a library module containing code that can be shared easily across multiple Flutter or Dart projects.

For help getting started with Flutter, view our [online documentation](https://flutter.io/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Built with

- [Flutter](https://flutter.dev/) - Beautiful native apps in record time.
- [Android Studio](https://developer.android.com/studio/index.html/) - Tools for building apps on every type of Android device.
- [Visual Studio Code](https://code.visualstudio.com/) - Code editing. Redefined.

## Authors

- **Jesús Rodríguez** - you can find me on [GitHub](https://github.com/jesusrp98), [Twitter](https://twitter.com/jesusrp98) & [Reddit](https://www.reddit.com/user/jesusrp98).

## License

This project is licensed under the GNU GPL v3 License - see the [LICENSE](LICENSE) file for details.
