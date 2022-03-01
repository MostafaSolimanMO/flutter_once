import 'package:flutter/widgets.dart';
import 'package:flutter_once/src/builder.dart';
import 'package:once/once.dart';

export 'package:once/once.dart';

abstract class OnceWidget {
  /// A generic callback that runs on an every new version
  static FutureBuilder<Widget?> showOnEveryNewVersion<T>({
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      Once.runOnEveryNewVersion(callback: builder),
      fallback,
    );
  }

  /// A generic callback that runs every once
  static FutureBuilder<Widget?> showOnce<T>(
    String key, {
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      Once.runOnce(key, callback: builder),
      fallback,
    );
  }

  /// A generic callback that runs every 12 hours
  static FutureBuilder<Widget?> showEvery12Hours<T>(
    String key, {
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      Once.runEvery12Hours(key, callback: builder),
      fallback,
    );
  }

  /// A generic callback that runs every hours
  static FutureBuilder<Widget?> showHourly<T>(
    String key, {
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      Once.runHourly(key, callback: builder),
      fallback,
    );
  }

  /// A generic callback that runs every day
  static FutureBuilder<Widget?> showDaily<T>(
    String key, {
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      Once.runDaily(key, callback: builder),
      fallback,
    );
  }

  /// A generic callback that runs every week
  static FutureBuilder<Widget?> showWeekly<T>(
    String key, {
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      OnceRunner.run(
        key: key,
        duration: Const.week,
        callback: builder,
      ),
      fallback,
    );
  }

  /// A generic callback that runs every new month
  static FutureBuilder<Widget?> showMonthly<T>(
    String key, {
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      OnceRunner.run(
        key: key,
        duration: -1,
        callback: builder,
      ),
      fallback,
    );
  }

  /// A generic callback that runs every month
  static FutureBuilder<Widget?> showOnNewMonth<T>(
    String key, {
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      OnceRunner.run(
        key: key,
        duration: DateTime.now().month,
        callback: builder,
      ),
      fallback,
    );
  }

  /// A generic callback that runs yearly
  static FutureBuilder<Widget?> showYearly<T>(
    String key, {
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      OnceRunner.run(
        key: key,
        duration: Const.year,
        callback: builder,
      ),
      fallback,
    );
  }

  /// A generic callback that runs on a custom basis set by the user/developer
  /// by referencing a period [duration]
  static FutureBuilder<Widget?> showCustom<T>(
    String key, {
    required Duration duration,
    required Widget? Function() builder,
    Widget? Function()? fallback,
  }) {
    return OnceBuilder.build(
      OnceRunner.run(
        key: key,
        duration: duration.inMilliseconds,
        callback: builder,
      ),
      fallback,
    );
  }
}
