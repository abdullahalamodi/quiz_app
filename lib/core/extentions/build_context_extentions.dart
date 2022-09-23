import 'package:flutter/material.dart';

//const for import file
const ee = null;

extension AppThemeExtension on BuildContext {
  TextTheme get tthm => Theme.of(this).textTheme;
}

extension ScreanSizeEx on BuildContext {
  ///
  double get w => MediaQuery.of(this).size.width;
  double get h => MediaQuery.of(this).size.height;
}

extension NavigatorEx on BuildContext {
  /// context.push()
  Future<T?> push<T>({
    required Widget Function(BuildContext) builder,
  }) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: builder),
    );
  }

  Future<T?> replace<T>({
    required Widget Function(BuildContext) builder,
  }) {
    return Navigator.of(this).pushReplacement<T, void>(
      MaterialPageRoute(builder: builder),
    );
  }
}
