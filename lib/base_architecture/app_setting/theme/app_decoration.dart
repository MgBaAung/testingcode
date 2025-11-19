import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/app_setting/theme/theme_helper.dart';
import 'package:testingapp/base_architecture/app_setting/utils/pref_utils.dart';
import 'package:testingapp/base_architecture/app_setting/utils/size_utils.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: themeNotifier.appTheme.blue50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: themeNotifier.appTheme.bgColor,
        borderRadius: BorderRadius.circular(10.h),
      );

  static BoxDecoration get fillGray200 => BoxDecoration(
        color: themeNotifier.appTheme.gray200,
      );
  static BoxDecoration get fillGreen => BoxDecoration(
        color: themeNotifier.appTheme.green50,
      );
  static BoxDecoration get fillGreen5001 => BoxDecoration(
        color: themeNotifier.appTheme.green5001,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: themeNotifier.theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillOrange => BoxDecoration(
        color: themeNotifier.appTheme.orange50,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: themeNotifier.theme.colorScheme.primary,
      );
  static BoxDecoration get fillWhite => BoxDecoration(
        color: themeNotifier.theme.colorScheme.primary,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: themeNotifier.appTheme.red50,
      );
  static BoxDecoration get modalDecoration => BoxDecoration(
        color: themeNotifier.appTheme.whiteA700,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.h),
          topRight: Radius.circular(25.h),
        ),
      );

  static BoxDecoration get bgDecoration => BoxDecoration(
      color: themeNotifier.appTheme.bgColor,
      borderRadius: BorderRadius.circular(10.h));

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: themeNotifier.appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: themeNotifier.appTheme.black900.withOpacity(0.05),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              -1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration();

  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        color: themeNotifier.appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: themeNotifier.appTheme.black900.withOpacity(0.12),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBluegray100021 => BoxDecoration(
        color: themeNotifier.appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: themeNotifier.appTheme.blueGray100,
            spreadRadius: 0.h,
            blurRadius: 0.5.h,
            offset: const Offset(
              0,
              1,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: themeNotifier.appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: themeNotifier.appTheme.blueGray100,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBluegray10001 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: themeNotifier.appTheme.blueGray10001,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray100011 => BoxDecoration(
        border: Border.all(
          color: themeNotifier.appTheme.blueGray10001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: themeNotifier.appTheme.whiteA700,
      );
  static BoxDecoration get outlineGray50 => BoxDecoration(
        color: themeNotifier.appTheme.whiteA700,
        border: Border.all(
          color: themeNotifier.appTheme.gray50,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: themeNotifier.appTheme.gray9000f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGreen => BoxDecoration(
        color: themeNotifier.appTheme.whiteA700,
        border: Border.all(
          color: themeNotifier.appTheme.green300,
          width: 1.h,
        ),
      );

  static BoxDecoration get primaryDecorate => BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.adaptSize),
      );

  static BoxDecoration get secondDecorate => BoxDecoration(
        color: themeNotifier.appTheme.bgColor,
        borderRadius: BorderRadius.circular(20.adaptSize),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get circleBorder32 => BorderRadius.circular(
        32.h,
      );
  static BorderRadius get circleBorder9 => BorderRadius.circular(
        9.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL16 => BorderRadius.vertical(
        top: Radius.circular(16.h),
      );
  static BorderRadius get customBorderTL8 => BorderRadius.vertical(
        top: Radius.circular(8.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );

  static BoxDecoration round8Border(double radius) => BoxDecoration(
        borderRadius: BorderRadius.circular(radius.adaptSize),
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

final ThemeHelper themeNotifier = ThemeHelper();
late PrefUtils prefUtils;

