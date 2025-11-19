import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/app_setting/theme/app_decoration.dart';
import 'package:testingapp/base_architecture/app_setting/utils/size_utils.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillGrayE => ElevatedButton.styleFrom(
        backgroundColor: themeNotifier.appTheme.gray9001e,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );

  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
