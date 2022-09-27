import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
        ),
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: context.tthm.bodyMedium!.copyWith(
            fontFamily: FixedAssets.cairo,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            minimumSize: const Size(130, 50),
            textStyle: context.tthm.bodyMedium!.copyWith(
              fontSize: 16,
              height: 1.2,
              fontFamily: FixedAssets.cairo,
            ),
          ),
        ),
        fontFamily: FixedAssets.cairo,
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(
              bodyMedium: context.tthm.bodyMedium!.copyWith(
                height: 1.2,
              ),
            )
            .apply(
              fontFamily: FixedAssets.cairo,
            ),
      );
}
