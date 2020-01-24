import 'package:flutter/material.dart';

/// Widget that will inform the user about a specific topic.
/// Information could be transmitted via text, icons or any other widget.
///
/// Also, the user could interact with this view using the [actionCallback].
class BigTip extends StatelessWidget {
  /// Widget representing the main information point of the view.
  ///
  /// If this parameters holds a [Icon] widget, an automatic theme will be applied,
  /// setting 100 as its size, and using the caption text style's color by default.
  final Widget child;

  /// Space between the [child] and the text. Default value is 22.
  final double space;

  /// Outter padding of the view. Default is 32.
  final EdgeInsets padding;

  /// Main title text of the view.
  final String title;

  /// Secondary text of the view.
  final String subtitle;

  /// Label that will inform the user about the action
  /// the view can perform, via the [actionCallback] parameter.
  final String action;

  /// Text style attached of the [title] property.
  final TextStyle titleStyle;

  /// Text style attached of the [subtitle] property.
  final TextStyle subtitleStyle;

  /// Text style attached of the [action] property.
  final TextStyle actionStyle;

  /// Action that will be performed when the user clicks the action button.
  final Function() actionCallback;

  const BigTip({
    Key key,
    @required this.child,
    this.space = 22,
    this.padding,
    this.title,
    this.subtitle,
    this.action,
    this.titleStyle,
    this.subtitleStyle,
    this.actionStyle,
    this.actionCallback,
  })  : assert(action != null || actionCallback == null),
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
            if (title != null || subtitle != null) SizedBox(height: space ?? 0),
            if (title != null)
              Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle ?? Theme.of(context).textTheme.title,
              ),
            if (subtitle != null) ...[
              SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: subtitleStyle ?? Theme.of(context).textTheme.subhead,
              ),
            ],
            if (action != null) ...[
              Flexible(child: SizedBox.expand()),
              FlatButton(
                onPressed: actionCallback,
                textColor: Theme.of(context).accentColor,
                child: Text(
                  action,
                  style: actionStyle ?? TextStyle(fontSize: 16),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
