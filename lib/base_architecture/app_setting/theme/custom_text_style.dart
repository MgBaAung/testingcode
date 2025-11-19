import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/app_setting/theme/app_decoration.dart';
import 'package:testingapp/base_architecture/app_setting/utils/size_utils.dart';

class CustomTextStyles {
  static get bodyLargeBluegray800 => themeNotifier.theme.textTheme.bodyLarge!
      .copyWith(color: themeNotifier.appTheme.blueGray800);
  static get bodyLargeBluegray90002 => themeNotifier.theme.textTheme.bodyLarge!
      .copyWith(color: themeNotifier.appTheme.blueGray90002);
  static get bodyLargeGray60001 => themeNotifier.theme.textTheme.bodyLarge!
      .copyWith(color: themeNotifier.appTheme.gray60001);
  static get bodyLargeGray900 => themeNotifier.theme.textTheme.bodyLarge!
      .copyWith(color: themeNotifier.appTheme.gray900);
  static get bodyMediumBluegray90001 => themeNotifier
      .theme
      .textTheme
      .bodyMedium!
      .copyWith(color: themeNotifier.appTheme.blueGray90001);
  static get bodyMediumGray600 => themeNotifier.theme.textTheme.bodyMedium!
      .copyWith(color: themeNotifier.appTheme.gray600);
  static get bodyMediumGray60001 => themeNotifier.theme.textTheme.bodyMedium!
      .copyWith(color: themeNotifier.appTheme.gray60001);
  static bodyMedium({Color? color, FontWeight? fontWeight, double? fsize}) =>
      themeNotifier.theme.textTheme.bodyMedium!.roboto.copyWith(
        color: color,
        fontSize: (fsize ?? 12).fSize,
        fontWeight: fontWeight,
      );

  static get hintTextStyle =>
      themeNotifier.theme.textTheme.bodyMedium!.roboto.copyWith(
        color: themeNotifier.appTheme.thirdColor,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );

  static get inputTextStyle =>
      themeNotifier.theme.textTheme.bodyMedium!.roboto.copyWith(
        color: themeNotifier.appTheme.thirdColor,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );

  static get subTitleStyle =>
      themeNotifier.theme.textTheme.bodyMedium!.roboto.copyWith(
        color: themeNotifier.appTheme.thirdColor,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
      );

  static get bodySmallGray900 =>
      themeNotifier.theme.textTheme.bodySmall!.roboto.copyWith(
        color: themeNotifier.appTheme.gray900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );

  static get bodySmallWhit =>
      themeNotifier.theme.textTheme.bodySmall!.roboto.copyWith(
        color: themeNotifier.appTheme.whiteA700,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );

  static get bodyMediumRobotoPrimaryContainer => themeNotifier
      .theme
      .textTheme
      .bodyMedium!
      .roboto
      .copyWith(color: themeNotifier.theme.colorScheme.primaryContainer);
  static get bodySmallAmber700 => themeNotifier.theme.textTheme.bodySmall!
      .copyWith(color: themeNotifier.appTheme.amber700);
  static get titlStyle =>
      themeNotifier.theme.textTheme.titleSmall!.roboto.copyWith(
        color: themeNotifier.appTheme.offsiteColor,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
      );
  static get bodySmallGray60002 => themeNotifier.theme.textTheme.bodySmall!
      .copyWith(color: themeNotifier.appTheme.gray60002);
  static get bodySmallGray800 => themeNotifier.theme.textTheme.bodySmall!
      .copyWith(color: themeNotifier.appTheme.gray800);
  static get bodySmallGray900_1 => themeNotifier.theme.textTheme.bodySmall!
      .copyWith(color: themeNotifier.appTheme.gray900);
  static get bodySmallPrimary => themeNotifier.theme.textTheme.bodySmall!
      .copyWith(color: themeNotifier.theme.colorScheme.primary);
  static get bodySmallRed500 => themeNotifier.theme.textTheme.bodySmall!
      .copyWith(color: themeNotifier.appTheme.red);
  static get bodySmallRobotoWhiteA700 => themeNotifier
      .theme
      .textTheme
      .bodySmall!
      .roboto
      .copyWith(color: themeNotifier.appTheme.whiteA700);
  static get bodySmallSecondaryContainer => themeNotifier
      .theme
      .textTheme
      .bodySmall!
      .copyWith(color: themeNotifier.theme.colorScheme.secondaryContainer);
  static get bodySmallWhiteA700 => themeNotifier.theme.textTheme.bodySmall!
      .copyWith(color: themeNotifier.appTheme.whiteA700);
  static get bodySmallff777777 => themeNotifier.theme.textTheme.bodySmall!
      .copyWith(color: const Color(0XFF777777));
  static get bodySmallff858585 => themeNotifier.theme.textTheme.bodySmall!
      .copyWith(color: const Color(0XFF858585));

  // Label text style
  static get labelLargeGray800 =>
      themeNotifier.theme.textTheme.labelLarge!.copyWith(
        color: themeNotifier.appTheme.gray800,
        fontWeight: FontWeight.w400,
      );
  static get labelLargePrimary => themeNotifier.theme.textTheme.labelLarge!
      .copyWith(color: themeNotifier.theme.colorScheme.primary);
  static get labelLargeRobotoGray800 => themeNotifier
      .theme
      .textTheme
      .labelLarge!
      .roboto
      .copyWith(color: themeNotifier.appTheme.gray800);
  static get labelLargeff198f51 => themeNotifier.theme.textTheme.labelLarge!
      .copyWith(color: const Color(0XFF198F51));
  static get labelMediumAmber700 => themeNotifier.theme.textTheme.labelMedium!
      .copyWith(color: themeNotifier.appTheme.amber700);
  static get labelMediumLightgreen800 => themeNotifier
      .theme
      .textTheme
      .labelMedium!
      .copyWith(color: themeNotifier.appTheme.lightGreen800);
  static get labelMediumOnError => themeNotifier.theme.textTheme.labelMedium!
      .copyWith(color: themeNotifier.theme.colorScheme.onError);
  // Title text style

  static get titleMediumBluegray800 =>
      themeNotifier.theme.textTheme.titleMedium!.copyWith(
        color: themeNotifier.appTheme.blueGray800,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBluegray90001 => themeNotifier
      .theme
      .textTheme
      .titleMedium!
      .copyWith(color: themeNotifier.appTheme.blueGray90001);
  static get titleMediumGray60001 => themeNotifier.theme.textTheme.titleMedium!
      .copyWith(color: themeNotifier.appTheme.gray60001.withOpacity(0.49));
  static get titleMediumGray800 => themeNotifier.theme.textTheme.titleMedium!
      .copyWith(color: themeNotifier.appTheme.gray800);
  static get titleMediumGray900 =>
      themeNotifier.theme.textTheme.titleMedium!.copyWith(
        color: themeNotifier.appTheme.gray900,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumGray900Medium =>
      themeNotifier.theme.textTheme.titleMedium!.copyWith(
        color: themeNotifier.appTheme.gray900,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray900_1 => themeNotifier.theme.textTheme.titleMedium!
      .copyWith(color: themeNotifier.appTheme.gray900);
  static get titleMediumMedium => themeNotifier.theme.textTheme.titleMedium!
      .copyWith(fontWeight: FontWeight.w500);
  static get titleMediumPrimary => themeNotifier.theme.textTheme.titleMedium!
      .copyWith(color: themeNotifier.theme.colorScheme.primary);
  static get titleMediumWhiteA700 => themeNotifier.theme.textTheme.titleMedium!
      .copyWith(color: themeNotifier.appTheme.whiteA700);
  static get titleMediumWhiteA700SemiBold =>
      themeNotifier.theme.textTheme.titleMedium!.roboto.copyWith(
        color: themeNotifier.appTheme.whiteA700,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumWhite400 =>
      themeNotifier.theme.textTheme.titleMedium!.roboto.copyWith(
        color: themeNotifier.appTheme.whiteA700,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );

  static get titleMediumBlack =>
      themeNotifier.theme.textTheme.titleMedium!.roboto.copyWith(
        color: const Color(0xFF141414),
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );

  static get titleSmallBluegray900 => themeNotifier.theme.textTheme.titleSmall!
      .copyWith(color: themeNotifier.appTheme.blueGray900);
  static get titleSmallBluegray90001 =>
      themeNotifier.theme.textTheme.titleSmall!.copyWith(
        color: themeNotifier.appTheme.blueGray90001,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallGray300 =>
      themeNotifier.theme.textTheme.titleSmall!.copyWith(
        color: themeNotifier.appTheme.gray300,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallGray500 => themeNotifier.theme.textTheme.titleSmall!
      .copyWith(color: themeNotifier.appTheme.gray500);
  static get titleSmallGray900 => themeNotifier.theme.textTheme.titleSmall!
      .copyWith(color: themeNotifier.appTheme.gray900);
  static get titleSmallPrimary => themeNotifier.theme.textTheme.titleSmall!
      .copyWith(color: themeNotifier.theme.colorScheme.primary);
  static get titleSmallPrimaryContainer => themeNotifier
      .theme
      .textTheme
      .titleSmall!
      .copyWith(color: themeNotifier.theme.colorScheme.primaryContainer);
  static titleSmallPrimarySemiBold({double? fsize, Color? color}) =>
      themeNotifier.theme.textTheme.titleSmall!.copyWith(
        color: color,
        fontSize: (fsize ?? 16).fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRoboto => themeNotifier
      .theme
      .textTheme
      .titleSmall!
      .roboto
      .copyWith(fontSize: 12.fSize, fontWeight: FontWeight.w500);

  static get titleSmallRobotoGray500 => themeNotifier
      .theme
      .textTheme
      .titleSmall!
      .roboto
      .copyWith(color: themeNotifier.appTheme.gray500);
  static get titleSmallRobotoPrimary => themeNotifier
      .theme
      .textTheme
      .titleSmall!
      .roboto
      .copyWith(color: themeNotifier.theme.colorScheme.primary);
  static get titleSmallRobotoWhiteA700 => themeNotifier
      .theme
      .textTheme
      .titleSmall!
      .roboto
      .copyWith(color: themeNotifier.appTheme.whiteA700);
  static get titleSmallWhiteA700 => themeNotifier.theme.textTheme.titleSmall!
      .copyWith(color: themeNotifier.appTheme.whiteA700);

  static captionRegular({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) => themeNotifier.theme.textTheme.bodySmall!.roboto.copyWith(
    fontWeight: fontWeight ?? FontWeight.w400,
    fontSize: fontSize ?? 12.fSize,
    color: color,
  );

  static caption({Color? color, FontWeight? fontWeight, double? fontSize}) =>
      themeNotifier.theme.textTheme.labelLarge!.roboto.copyWith(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: (fontSize ?? 12).fSize,
        color: color,
      );

  static heading3BoldBlack({
    FontWeight? fontWeight,
    double? fsize,
    Color? color,
  }) => themeNotifier.theme.textTheme.headlineMedium!.roboto.copyWith(
    fontWeight: fontWeight ?? FontWeight.w700,
    fontSize: (fsize ?? 20).fSize,
    color: color,
  );

  static headingSemibold({
    FontWeight? fontWeight,
    double? fsize,
    Color? color,
  }) => themeNotifier.theme.textTheme.headlineSmall!.roboto.copyWith(
    fontWeight: fontWeight ?? FontWeight.w700,
    fontSize: (fsize ?? 20).fSize,
    color: color,
  );

  static TextStyle bodyRegularBlack({
    Color? color,
    FontWeight? fontWeight,
    double? fSize,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => themeNotifier.theme.textTheme.bodySmall!.roboto.copyWith(
    fontWeight: fontWeight ?? FontWeight.w400,
    fontSize: (fSize ?? 14).fSize,
    color: color,
    decoration: textDecoration,
    decorationColor: decorationColor,
  );

  static bodySemibold({Color? color, FontWeight? fontWeight}) =>
      themeNotifier.theme.textTheme.bodyLarge!.roboto.copyWith(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: 15.fSize,
        color: color,
      );

  static head3Bold({FontWeight? fontWeight, double? fontSize, Color? color}) =>
      themeNotifier.theme.textTheme.headlineMedium!.roboto.copyWith(
        fontWeight: fontWeight ?? FontWeight.w700,
        fontSize: fontSize ?? 20.fSize,
        color: color,
      );
  static captionStyle({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
  }) => themeNotifier.theme.textTheme.bodySmall?.copyWith(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );

  static titleLarge({Color? color, double? fsize, FontWeight? fontWeight}) =>
      themeNotifier.theme.textTheme.titleLarge!.roboto.copyWith(
        color: color,
        fontSize: fsize,
        fontWeight: fontWeight,
      );
  static heading3({Color? color, double? fsize, FontWeight? fontWeight}) =>
      themeNotifier.theme.textTheme.headlineSmall!.roboto.copyWith(
        fontSize: (fsize ?? 20).fSize,
        fontWeight: fontWeight,
        color: color,
      );

  static headingLarge({Color? color, double? fsize, FontWeight? fontWeight}) =>
      themeNotifier.theme.textTheme.headlineLarge!.roboto.copyWith(
        fontSize: (fsize ?? 16).fSize,
        fontWeight: fontWeight,
        color: color,
      );
  static heading2({Color? color, double? fsize, FontWeight? fontWeight}) =>
      themeNotifier.theme.textTheme.displaySmall!.roboto.copyWith(
        fontSize: (fsize ?? 24).fSize,
        fontWeight: fontWeight,
        color: color,
      );

  static headingMedium({Color? color, double? fsize, FontWeight? fontWeight}) =>
      themeNotifier.theme.textTheme.headlineMedium!.roboto.copyWith(
        fontSize: (fsize ?? 24).fSize,
        fontWeight: fontWeight,
        color: color,
      );

  static get bodyMediumGray900 =>
      themeNotifier.theme.textTheme.bodyMedium!.roboto.copyWith(
        color: themeNotifier.appTheme.gray900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );
  static overLine({Color? color, double? fSize, FontWeight? fontWeight}) =>
      themeNotifier.theme.textTheme.labelSmall!.roboto.copyWith(
        color: color,
        fontSize: (fSize ?? 13).fSize,
        fontWeight: fontWeight,
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(fontFamily: 'Roboto');
  }

  TextStyle get inter {
    return copyWith(fontFamily: 'Inter');
  }

  TextStyle get nunitoSans {
    return copyWith(fontFamily: 'Nunito Sans');
  }
}
