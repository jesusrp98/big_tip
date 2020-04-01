import 'package:flutter/material.dart';

/// Widget that will inform the user about a specific topic.
/// Information could be transmitted via text, icons or any other widget.
///
/// Also, the user could interact with this view using the [actionCallback].
class BigTip extends StatelessWidget {
  /// Widget representing the main information point of the view.
  ///
  /// If this parameters holds a [Icon] widget, an automatic theme will be applied,
  /// setting its size to 100, and using the caption text style's color by default.
  final Widget child;

  /// Space between the [child] and the text. Default value is 22.
  final double space;

  /// Space between [tile] and [subtitle] widgets. Default value is 8.
  final double textSpace;

  /// Outter padding of the view. Default is 32.
  final EdgeInsets padding;

  /// Main title widget of the view. Usually a [Text] widget.
  final Widget title;

  /// Secondary widget of the view. Usually a [Text] widget.
  final Widget subtitle;

  /// Widget that will inform the user about the action
  /// the view can perform, via the [actionCallback] parameter.
  final Widget action;

  /// Action that will be performed when the user clicks the action button.
  final Function() actionCallback;

  const BigTip({
    Key key,
    this.child,
    this.space = 22,
    this.textSpace = 8,
    this.padding,
    this.title,
    this.subtitle,
    this.action,
    this.actionCallback,
  })  : assert(action != null || actionCallback == null),
        assert(child != null || title != null || subtitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (action != null) Flexible(child: SizedBox.expand()),
            IconTheme.merge(
              data: Theme.of(context).iconTheme.copyWith(
                    color: Theme.of(context).textTheme.caption.color,
                    size: 100,
                  ),
              child: child,
            ),
            if (title != null || subtitle != null) SizedBox(height: space),
            if (title != null)
              DefaultTextStyle(
                style: Theme.of(context).textTheme.headline6,
                child: title,
              ),
            if (subtitle != null) ...[
              if (title != null) SizedBox(height: textSpace),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.subtitle1,
                child: subtitle,
              ),
            ],
            if (action != null) ...[
              Flexible(child: SizedBox.expand()),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.subtitle1,
                child: FlatButton(
                  textColor: Theme.of(context).accentColor,
                  onPressed: actionCallback,
                  child: action,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
