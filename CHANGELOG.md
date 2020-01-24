## [1.0.0] - January 24th, 2020

- Now this package is consider **STABLE**: no more breaking changes expected.
- **BREAKING CHANGE:** Deleted the `icon` parameter in favor of a more generic `child` parameter: now you can use other kind of widgets. As such, other parameters like `iconSize` and `iconColor` have been deleted.
- **BREAKING CHANGE:** Deleted the `message` parameter. Now you have the ability to add two label fields: a title and a subtitle, each with its own style parameter.
- Added the ability to add a button at the bottom of the view, for the user to perform some kind of action, established on the `actionCallback` parameter.
- The view now applies a custom icon theme via `IconTheme`, if the developer uses a `Icon` widget as the `child` widget. This theme is similiar to the one used previously.
- Space between the `child` widget and the title text has been lowered to `22`.

## [0.1.0] - December 5th, 2019

- First release!
