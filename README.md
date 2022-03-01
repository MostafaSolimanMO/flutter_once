# flutter_once

### Built on [once](https://pub.dev/packages/once).

Want to show a widget once periodically (Daily - Weekly - Monthly - Yearly - Any period)? We got you.

----

Some widgets should show **_OnceWidget_**.
* Users should only get the guided widget _OnceWidget_.
* Release notes widget should only pop up _OnceWidget every new app version comes_.
* Etc.. _OnceWidget every (Whatever you want)_.

`OnceWidgets` supports `showOnce`, `showOnEveryNewVersion`, `showEvery12Hours`, `showHourly`, `showDaily`, `showWeekly`, `showMonthly`, `showOnNewMonth`, `showYearly` and `Custom (Duration)`.

## Usage

**Mainly builder functions consists of builders and fallbacks**
* `builder` is the generic function that shows and returns a `Widget` .
* `fallback` is the same but only shows in case that callback future returns null (defaults to `SizedBox.shrink()`).

Now you're ready to go. Say you wanted to view a banner widget when the app is updated:

```dart
OnceWidget.showOnEveryNewVersion(
  builder: () {
   return Container(...);
  },
);
```

Or maybe you want to show the rate this app dialog every week for the user:
```dart
Once.showWeekly("ratingDialog",
  builder: () {
     return Text('Hello, New Week');
   },
  fallback: () {
     return Text('Hello!');
   },
);

```

## Contributors
* [Mostafa Soliman](https://github.com/MostafaSolimanMO)
* [Nour Magdi](https://github.com/SPiercer)


inspired by the java library [Once](https://github.com/jonfinerty/Once) made by [Jon Finerty](https://github.com/jonfinerty)
