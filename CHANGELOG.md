## [1.1.0] - April 3rd, 2020

- A copuple and neccesary modifications have been made to the package, and unfortunatelly some breaking changes have been introduced.
- **BREAKING CHANGE:** Changed `title`, `subtitle` and `action` to be `Widget`parameters, insteead of `String`. This will allow a more customized used of this package.
- **BREAKING CHANGE:** Deleted all style parameters. If you want to apply style, you could simply apply it directly to the widget itself.
- Added `subtitleSpace` parameter, to regulate the division between the `title` and `subtitle` widgets.
- Added a bunch of tests.
- Fixed quite a few bugs.
- Added GitHub Actions CI.
- Updated minium Flutter SDK to v1.10.

## [1.0.0] - January 24th, 2020

- Now this package is consider **STABLE**: no more breaking changes expected.
- **BREAKING CHANGE:** Deleted the `icon` parameter in favor of a more generic `child` parameter: now you can use other kind of widgets. As such, other parameters like `iconSize` and `iconColor` have been deleted.
- **BREAKING CHANGE:** Deleted the `message` parameter. Now you have the ability to add two label fields: a title and a subtitle, each with its own style parameter.
- Added the ability to add a button at the bottom of the view, for the user to perform some kind of action, established on the `actionCallback` parameter.
- The view now applies a custom icon theme via `IconTheme`, if the developer uses a `Icon` widget as the `child` widget. This theme is similiar to the one used previously.
- Space between the `child` widget and the title text has been lowered to `22`.

## [0.1.0] - December 5th, 2019

- First release!
