import 'package:flutter/material.dart';

/// This simple widget aims to show the user a [message], coupled with a huge [icon] above it.
class BigTip extends StatelessWidget {
  /// Main iicon that will render in the center of the screen.
  final IconData icon;

  /// Size of the [icon]. Default value is 100.
  final double iconSize;

  /// Color of the [icon]. Default is the caption color of the current theme.
  final Color iconColor;

  /// Space between the [icon] and the [message] widgets. Default value is 27.
  final double space;

  /// Padding of this widget.
  final EdgeInsets padding;

  /// Text message that will render below the main [icon].
  final String message;

  /// Text style attached of the [message] property.
  final TextStyle messageStyle;

  const BigTip({
    Key key,
    @required this.icon,
    this.iconSize = 100,
    this.iconColor,
    this.space = 27,
    this.padding,
    @required this.message,
    this.messageStyle,
  })  : assert(icon != null),
        assert(iconSize != null),
        assert(space != null),
        assert(message != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              size: iconSize,
              color: iconColor ?? Theme.of(context).textTheme.caption.color,
            ),
            SizedBox(height: space),
            Text(
              message,
              textAlign: TextAlign.center,
              style: messageStyle ?? TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
