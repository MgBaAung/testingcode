import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testingapp/base_architecture/app_setting/theme/app_decoration.dart';
import 'package:testingapp/base_architecture/app_setting/utils/key_utils.dart';
import 'package:testingapp/base_architecture/app_setting/utils/size_utils.dart';
import 'package:testingapp/base_architecture/app_setting/utils/type_util.dart';

TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
  bodyLarge: TextStyle(
    color: themeNotifier.appTheme.gray800,
    fontSize: 16.fSize,
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    color: themeNotifier.appTheme.gray800,
    fontSize: 14.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    color: themeNotifier.appTheme.gray60001,
    fontSize: 12.fSize,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  ),
  headlineLarge: TextStyle(
    color: themeNotifier.appTheme.gray900,
    fontSize: 30.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  ),
  labelLarge: TextStyle(
    color: colorScheme.onPrimaryContainer,
    fontSize: 12.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.fSize,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
  ),
  labelMedium: TextStyle(
    color: themeNotifier.appTheme.gray800,
    fontSize: 10.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  ),
  titleLarge: TextStyle(
    color: colorScheme.primaryContainer,
    fontSize: 20.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  ),
  titleMedium: TextStyle(
    color: colorScheme.primaryContainer,
    fontSize: 16.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  ),
  titleSmall: TextStyle(
    color: themeNotifier.appTheme.gray800,
    fontSize: 14.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  ),
);
TextTheme darkText(ColorScheme colorScheme) => TextTheme(
  bodyLarge: TextStyle(
    color: Colors.white,
    fontSize: 16.fSize,
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    color: Colors.white,
    fontSize: 14.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    color: Colors.white,
    fontSize: 12.fSize,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  ),
  headlineLarge: TextStyle(
    color: Colors.white,
    fontSize: 30.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  ),
  labelLarge: TextStyle(
    color: Colors.white,
    fontSize: 12.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  ),
  headlineSmall: TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 20.fSize,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
  ),
  labelMedium: TextStyle(
    color: Colors.white,
    fontSize: 10.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  ),
  titleLarge: TextStyle(
    color: Colors.white,
    fontSize: 20.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  ),
  titleMedium: TextStyle(
    color: Colors.white,
    fontSize: 16.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  ),
  titleSmall: TextStyle(
    color: Colors.white,
    fontSize: 14.fSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  ),
);

/// Class containing the supported color schemes.
const primaryColorScheme = ColorScheme.light(
  // Primary colors
  primary: Color(0XFF080808),
  primaryContainer: Color(0XFF1F1F1F),
  secondaryContainer: Color(0XFF777777),

  // Error colors
  errorContainer: Color(0XFF545F70),
  onError: Color(0XFF3B82F6),

  // On colors(text colors)
  onPrimary: Color(0XFF121212),
  onPrimaryContainer: Color(0XFFB8B8B8),
);

const darkColorScheme = ColorScheme.dark(
  // Primary colors
  primary: Color(0XFF080808),
  primaryContainer: Color(0XFF1F1F1F),
  secondaryContainer: Color(0XFF777777),

  // Error colors
  errorContainer: Color(0XFF545F70),
  onError: Color(0XFF3B82F6),

  // On colors(text colors)
  onPrimary: Color(0XFF121212),
  onPrimaryContainer: Color(0XFFB8B8B8),
);

abstract class ColorsSchemes {
  Color get amber700 => const Color(0XFFF59E0B);
  Color get amber100 => const Color(0xFFFEF5E7);

  // Black
  Color get black900 => const Color(0XFF000000);

  // Blue
  Color get blue50 => const Color(0XFFE7EFFE);
  Color get blue100 => const Color(0xFF3B82F6);

  // BlueGray
  Color get blueGray100 => const Color(0XFFD9D9D9);
  Color get blueGray10001 => const Color(0XFFD6D6D6);
  Color get blueGray800 => const Color(0XFF374151);
  Color get blueGray900 => const Color(0XFF33363D);
  Color get blueGray90001 => const Color(0XFF333333);
  Color get blueGray90002 => const Color(0XFF1F2937);

  // Gray
  Color get gray200 => const Color(0XFFEBEBEB);
  Color get gray20001 => const Color(0XFFEAEAEA);
  Color get gray300 => const Color(0XFFE2E2E2);
  Color get gray400 => const Color(0XFFAFAFAF);
  Color get gray50 => const Color(0XFFF9F9F9);
  Color get gray500 => const Color(0XFF8F8F8F);
  Color get gray50001 => const Color(0XFF999999);
  Color get gray5001 => const Color(0XFFF5F5F5);
  Color get gray600 => const Color(0XFF858585);
  Color get gray60001 => const Color(0XFF707070);
  Color get gray60002 => const Color(0XFF6B7280);
  Color get gray700 => const Color(0XFF666666);
  Color get gray800 => const Color(0XFF3F3F3F);
  Color get gray900 => const Color(0XFF141414);
  Color get gray90001 => const Color(0XFF292929);

  // Grayf
  Color get gray9000f => const Color(0X0F061838);

  // Graye
  Color get gray9001e => const Color(0X1E1C1B1F);

  // Green
  Color get green300 => const Color(0XFF6FDD8D);
  Color get green50 => const Color(0XFFE8FFDD);

  Color get greenA400 => const Color(0XFF01F575);
  Color get primaryColor => const Color(0XFF198F51);

  // LightGreen
  Color get lightGreen800 => const Color(0XFF3BAF00);
  Color get green5001 => const Color(0XFFE9FFEB);

  // Orange
  Color get orange50 => const Color(0XFFFEF5E7);

  // Red
  Color get red50 => const Color(0XFFFEF2F2);
  Color get red => const Color(0xFFFF4242);

  // Teal
  Color get teal900 => const Color(0XFF0B4728);

  // White
  Color get whiteA700 => const Color(0XFFFFFFFF);

  // bgColor
  Color get bgColor => const Color(0xFFD9D9D9);

  // second bgColor
  Color get secondBgColor => const Color(0xFFF5F5F5);

  // third text color
  Color get thirdColor => const Color(0xFF737373);

  //// start /////
  Color get tenBlackColor => const Color(0x19020202);

  Color get twentyblack => const Color(0x33020202);

  Color get fivetyBlcakColor => const Color(0x7F020202);

  Color get greenColor => const Color(0xFF06B217);

  Color get fourBlackColor => const Color(0x0A020202);

  Color get black4Color => const Color(0x0A020202);

  Color get blackEightyColor => const Color(0xCC020202);

  Color get successColor => const Color(0xFF198754);

  Color get neutrals800Color => const Color(0xFF464646);

  Color get neutral500Color => const Color(0xFF898989);

  List<Color> get gdColor => [const Color(0x0A020202), const Color(0x0A020202)];

  Color get labelColor => const Color(0xFF020202).withOpacity(0.5);

  Color get imgColor => const Color(0xFF020202);
  List<Color> get radioGd => [const Color(0x0A020202), const Color(0x0A020202)];
  Color get radioBorder => const Color(0xFF020202).withOpacity(0.5);
  Color get radioBtn => Colors.white;
  Color get btSheet => const Color(0x33020202);
  Color get subTitle => const Color(0xFF464646);
  Color get blWhiteColor10 => const Color(0x0202021A);
  Color get blWhiteColor => Colors.white;
  Color get chatTextBox => Colors.white;
  Color get btnShawdow => const Color(0x09020202);
  Color get rpColor => const Color(0xFFB6B6B6);
  Color get rplBtnColor => const Color(0xFFE3E3E3);
  Color get rplDecoColor => const Color(0xFF2F2F2F);
  Color get pProfile => const Color(0x02020280);
  Color get arrowBtn => const Color(0xFFD9D9D9);
  Color get blWhiteColor20 => const Color(0xFF020202).withOpacity(0.2);
  Color get blWhiteColor50 => const Color(0xFF020202).withOpacity(0.5);
  Color get blWhiteColor2 => const Color(0x0A020202);
  Color get blWhiteBgColor => Colors.black;
  Color get offsiteColor => Colors.black;
  Color get dhNavigateColor => Colors.black;
  Color get blueColor => const Color(0xFF0098F5);
}

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    (255 * 0.2).toInt(), // Alpha (fully opaque)
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
  );
}

Color getFullRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    (255 * 0.7).toInt(), // Alpha (fully opaque)
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
  );
}

class DarkColors extends ColorsSchemes {
  @override
  Color get blueColor => const Color(0xFF0098F5);
  @override
  Color get dhNavigateColor => Colors.white.withOpacity(0.05);
  @override
  Color get offsiteColor => Colors.white;
  @override
  Color get blWhiteBgColor => Colors.black;

  @override
  Color get blWhiteColor2 => Colors.white.withOpacity(0.05);
  @override
  Color get blWhiteColor50 => const Color(0xFFFFFFFF).withOpacity(0.5);

  @override
  Color get blWhiteColor20 => const Color(0xFFFFFFFF).withOpacity(0.4);

  @override
  Color get arrowBtn => const Color(0xFFFFFFFF).withOpacity(0.2);

  @override
  Color get pProfile => const Color(0xFF737373);

  @override
  Color get rplDecoColor => const Color(0xFF2F2F2F);

  @override
  Color get rplBtnColor => const Color(0xFF191919);

  @override
  Color get rpColor => const Color(0xFF464646);

  @override
  Color get btnShawdow => const Color(0xFFFFFFFF).withOpacity(0.05);

  @override
  Color get chatTextBox => const Color.fromARGB(255, 15, 14, 14);

  @override
  Color get blWhiteColor => Colors.black;
  @override
  Color get subTitle => const Color(0xFFB6B6B6);
  @override
  Color get btSheet => const Color(0xFFFFFFFF);
  @override
  Color get imgColor => const Color(0xFFFAFAFA);
  @override
  List<Color> get radioGd => [const Color(0x0A020202), const Color(0x0A020202)];
  @override
  Color get radioBorder => const Color(0xFFFFFFFF).withOpacity(0.75);
  @override
  Color get blWhiteColor10 => const Color(0xFFFFFFFF).withOpacity(0.1);

  @override
  Color get radioBtn => Colors.black;

  // Amber
  @override
  Color get amber700 => const Color(0XFFF59E0B);
  @override
  Color get amber100 => const Color(0xFFFEF5E7);

  // Black
  @override
  Color get black900 => const Color(0XFF000000);

  // Blue
  @override
  Color get blue50 => const Color(0XFFE7EFFE);
  @override
  Color get blue100 => const Color(0xFF3B82F6);

  // BlueGray
  @override
  Color get blueGray100 => const Color(0XFFD9D9D9);
  @override
  Color get blueGray10001 => const Color(0XFFD6D6D6);
  @override
  Color get blueGray800 => const Color(0XFF374151);
  @override
  Color get blueGray900 => const Color(0XFF33363D);
  @override
  Color get blueGray90001 => const Color(0XFF333333);
  @override
  Color get blueGray90002 => const Color(0XFF1F2937);

  // Gray
  @override
  Color get gray200 => const Color(0XFFEBEBEB);
  @override
  Color get gray20001 => const Color(0XFFEAEAEA);
  @override
  Color get gray300 => const Color(0XFFE2E2E2);
  @override
  Color get gray400 => const Color(0XFFAFAFAF);
  @override
  Color get gray50 => const Color(0XFFF9F9F9);
  @override
  Color get gray500 => const Color(0XFF8F8F8F);
  @override
  Color get gray50001 => const Color(0XFF999999);
  @override
  Color get gray5001 => const Color(0XFFF5F5F5);
  @override
  Color get gray600 => const Color(0XFF858585);
  @override
  Color get gray60001 => const Color(0XFF707070);
  @override
  Color get gray60002 => const Color(0XFF6B7280);
  @override
  Color get gray700 => const Color(0XFF666666);
  @override
  Color get gray800 => const Color(0XFF3F3F3F);
  @override
  Color get gray900 => const Color(0XFF141414);
  @override
  Color get gray90001 => const Color(0XFF292929);

  // Grayf
  @override
  Color get gray9000f => const Color(0X0F061838);

  // Graye
  @override
  Color get gray9001e => const Color(0X1E1C1B1F);

  // Green
  @override
  Color get green300 => const Color(0XFF6FDD8D);
  @override
  Color get green50 => const Color(0XFFE8FFDD);

  @override
  Color get greenA400 => const Color(0XFF01F575);
  @override
  Color get primaryColor => const Color(0XFF198F51);

  // LightGreen
  @override
  Color get lightGreen800 => const Color(0XFF3BAF00);
  @override
  Color get green5001 => const Color(0XFFE9FFEB);

  // Orange
  @override
  Color get orange50 => const Color(0XFFFEF5E7);

  // Red
  @override
  Color get red50 => const Color(0XFFFEF2F2);
  @override
  Color get red => const Color(0xFFFF4242);

  // Teal
  @override
  Color get teal900 => const Color(0XFF0B4728);

  // White
  @override
  Color get whiteA700 => const Color(0XFFFFFFFF);

  // bgColor
  @override
  Color get bgColor => const Color(0xFFD9D9D9);

  // second bgColor
  @override
  Color get secondBgColor => const Color(0xFFF5F5F5);

  // third text color
  @override
  Color get thirdColor => const Color(0xFF737373);

  //// start /////
  @override
  Color get tenBlackColor => const Color(0x19020202);

  @override
  Color get twentyblack => const Color(0x33020202);

  @override
  Color get fivetyBlcakColor => const Color(0x7F020202);

  @override
  Color get greenColor => const Color(0xFF06B217);

  @override
  Color get fourBlackColor => const Color(0x0A020202);

  @override
  Color get black4Color => const Color(0x0A020202);

  @override
  Color get blackEightyColor => const Color(0xCC020202);

  @override
  Color get successColor => const Color(0xFF198754);

  @override
  Color get neutrals800Color => const Color(0xFF464646);

  @override
  Color get neutral500Color => const Color(0xFF898989);

  @override
  List<Color> get gdColor => [
    Colors.white.withOpacity(0.09),
    Colors.white.withOpacity(0.09),
  ];

  @override
  Color get labelColor => const Color(0xFFFFFFFF).withOpacity(0.5);
}

/// Class containing custom colors for a primary theme.
class PrimaryColors extends ColorsSchemes {
  @override
  Color get blueColor => const Color(0xFF0098F5);

  @override
  Color get dhNavigateColor => Colors.white;
  @override
  Color get offsiteColor => Colors.black;
  @override
  Color get blWhiteBgColor => const Color(0xFFFAFAFA);
  @override
  Color get blWhiteColor2 => const Color(0x0A020202);

  @override
  Color get blWhiteColor50 => const Color(0xFF020202).withOpacity(0.5);

  @override
  Color get blWhiteColor20 => const Color(0xFF020202).withOpacity(0.2);

  @override
  Color get arrowBtn => const Color(0xFFD9D9D9);

  @override
  Color get pProfile => const Color(0xFF020202).withOpacity(0.5);

  @override
  Color get rplDecoColor => const Color(0xFFCDCDCD);

  @override
  Color get rplBtnColor => const Color(0xFFE3E3E3);

  @override
  Color get rpColor => const Color(0xFFB6B6B6);

  @override
  Color get btnShawdow => const Color(0x09020202);

  @override
  Color get chatTextBox => Colors.white;
  @override
  Color get blWhiteColor => Colors.white;

  @override
  Color get blWhiteColor10 => const Color(0xFF020202).withOpacity(0.1);

  @override
  Color get subTitle => const Color(0xFF464646);

  @override
  Color get btSheet => const Color(0x33020202);

  @override
  Color get imgColor => const Color(0xFF020202);
  @override
  List<Color> get radioGd => [Colors.white, Colors.white];
  @override
  Color get radioBorder => const Color(0xFF020202).withOpacity(0.5);

  @override
  Color get radioBtn => Colors.white;

  // Amber
  @override
  Color get amber700 => const Color(0XFFF59E0B);
  @override
  Color get amber100 => const Color(0xFFFEF5E7);

  // Black
  @override
  Color get black900 => const Color(0XFF000000);

  // Blue
  @override
  Color get blue50 => const Color(0XFFE7EFFE);
  @override
  Color get blue100 => const Color(0xFF3B82F6);

  // BlueGray
  @override
  Color get blueGray100 => const Color(0XFFD9D9D9);
  @override
  Color get blueGray10001 => const Color(0XFFD6D6D6);
  @override
  Color get blueGray800 => const Color(0XFF374151);
  @override
  Color get blueGray900 => const Color(0XFF33363D);
  @override
  Color get blueGray90001 => const Color(0XFF333333);
  @override
  Color get blueGray90002 => const Color(0XFF1F2937);

  // Gray
  @override
  Color get gray200 => const Color(0XFFEBEBEB);
  @override
  Color get gray20001 => const Color(0XFFEAEAEA);
  @override
  Color get gray300 => const Color(0XFFE2E2E2);
  @override
  Color get gray400 => const Color(0XFFAFAFAF);
  @override
  Color get gray50 => const Color(0XFFF9F9F9);
  @override
  Color get gray500 => const Color(0XFF8F8F8F);
  @override
  Color get gray50001 => const Color(0XFF999999);
  @override
  Color get gray5001 => const Color(0XFFF5F5F5);
  @override
  Color get gray600 => const Color(0XFF858585);
  @override
  Color get gray60001 => const Color(0XFF707070);
  @override
  Color get gray60002 => const Color(0XFF6B7280);
  @override
  Color get gray700 => const Color(0XFF666666);
  @override
  Color get gray800 => const Color(0XFF3F3F3F);
  @override
  Color get gray900 => const Color(0XFF141414);
  @override
  Color get gray90001 => const Color(0XFF292929);

  // Grayf
  @override
  Color get gray9000f => const Color(0X0F061838);

  // Graye
  @override
  Color get gray9001e => const Color(0X1E1C1B1F);

  // Green
  @override
  Color get green300 => const Color(0XFF6FDD8D);
  @override
  Color get green50 => const Color(0XFFE8FFDD);

  @override
  Color get greenA400 => const Color(0XFF01F575);
  @override
  Color get primaryColor => const Color(0XFF198F51);

  // LightGreen
  @override
  Color get lightGreen800 => const Color(0XFF3BAF00);
  @override
  Color get green5001 => const Color(0XFFE9FFEB);

  // Orange
  @override
  Color get orange50 => const Color(0XFFFEF5E7);

  // Red
  @override
  Color get red50 => const Color(0XFFFEF2F2);
  @override
  Color get red => const Color(0xFFFF4242);

  // Teal
  @override
  Color get teal900 => const Color(0XFF0B4728);

  // White
  @override
  Color get whiteA700 => const Color(0XFFFFFFFF);

  // bgColor
  @override
  Color get bgColor => const Color(0xFFD9D9D9);

  // second bgColor
  @override
  Color get secondBgColor => const Color(0xFFF5F5F5);

  // third text color
  @override
  Color get thirdColor => const Color(0xFF737373);

  //// start /////
  @override
  Color get tenBlackColor => const Color(0x19020202);

  @override
  Color get twentyblack => const Color(0x33020202);

  @override
  Color get fivetyBlcakColor => const Color(0x7F020202);

  @override
  Color get greenColor => const Color(0xFF06B217);

  @override
  Color get fourBlackColor => const Color(0x0A020202);

  @override
  Color get black4Color => const Color(0x0A020202);

  @override
  Color get blackEightyColor => const Color(0xCC020202);

  @override
  Color get successColor => const Color(0xFF198754);

  @override
  Color get neutrals800Color => const Color(0xFF464646);

  @override
  Color get neutral500Color => const Color(0xFF898989);

  @override
  List<Color> get gdColor => [const Color(0x0A020202), const Color(0x0A020202)];

  @override
  Color get labelColor => const Color(0xFF020202).withOpacity(0.5);
}

class ThemeHelper with ChangeNotifier {
  String _appTheme = 'kPrimary';

  //List<String> viberates = ['Disabled', 'Default', 'Short', 'Long'];

  String get themes => _appTheme;

  String _language = '';

  bool saveOnGallery = false;

  bool chatHead = false;

  String get language => _language;

  Locale _currentLocale = const Locale('en', '');

  Locale get currentLocale => _currentLocale;

  bool _groupchat = true;
  bool get groupchat => _groupchat;

  bool _businesschat = true;
  bool get businesschat => _businesschat;

  bool _stories = false;
  bool get stories => _stories;

  bool _vibrate = true;
  bool get vibrate => _vibrate;

  bool _ringtone = true;
  bool get ringtone => _ringtone;

  bool _saveGallerys = false;
  bool get saveGallerys => _saveGallerys;

  int _fontsize = 14;
  int get fontsize => _fontsize;

  void changeLocale(Locale locale, BuildContext context, String lang) async {
    _currentLocale = locale;
    _language = lang;

    // First update EasyLocalization
    if (context.locale != locale) {
      try {
        context.setLocale(locale);
      } catch (e) {
        print("Error setting locale: $e");
      }
    }

    // Then force GetX to update
    try {
      // Get.updateLocale(locale);
    } catch (e) {
      print("Error updating GetX locale: $e");
    }

    // Save the setting
    await prefUtils.setData(kLng, lang);

    // Notify listeners after all updates
    notifyListeners();
  }

  void loadNotification() {
    getRingtone(kRingtone);
    getVibration(kVibtrate);
    getGroupchat(kGpChat);
    getBusinesschat(kbsChat);
    getStories(kStories);
  }

  // Load the theme from SharedPreferences
  Future<void> loadTheme() async {
    _appTheme = prefUtils.getThemeData();

    _language = await prefUtils.getData(kLng);
    notifyListeners();
  }

  // Toggle theme and save to SharedPreferences
  Future<void> toggleTheme(String value) async {
    if (!_supportedCustomColor.containsKey(value) ||
        !_supportedColorScheme.containsKey(value)) {
      throw Exception(
        "$value theme not found. Add it to the supported themes.",
      );
    }
    _appTheme = value;
    await prefUtils.setThemeData(value);
    notifyListeners();
  }

  Future<void> setFontSize(int value) async {
    _fontsize = value;
    await prefUtils.setInt(kFontSize, value);
    notifyListeners();
  }

  Future<void> getFontSize(String key) async {
    _fontsize = await prefUtils.getInt(key);
    notifyListeners();
  }

  Future<void> setRingtone(bool value) async {
    _ringtone = value;
    await prefUtils.setBool(kRingtone, value);
    notifyListeners();
  }

  Future<void> getRingtone(String key) async {
    _ringtone = await prefUtils.getBool(key);
    notifyListeners();
  }

  Future<void> setVibration(bool value) async {
    _vibrate = value;
    await prefUtils.setBool(kVibtrate, value);
    notifyListeners();
  }

  Future<void> getVibration(String key) async {
    _vibrate = await prefUtils.getBool(key);
    notifyListeners();
  }

  Future<void> setStories(bool value) async {
    _stories = value;
    await prefUtils.setBool(kStories, value);
    notifyListeners();
  }

  Future<void> getStories(String key) async {
    _stories = await prefUtils.getBool(key);
    notifyListeners();
  }

  Future<void> saveBusinessChat(bool value) async {
    _businesschat = value;
    await prefUtils.setBool(kbsChat, value);
    notifyListeners();
  }

  Future<void> getBusinesschat(String key) async {
    _businesschat = await prefUtils.getBool(key);
    notifyListeners();
  }

  Future<void> setGroupChat(bool value) async {
    _groupchat = value;
    await prefUtils.setBool(kGpChat, value);
    notifyListeners();
  }

  Future<void> getGroupchat(String key) async {
    _groupchat = await prefUtils.getBool(key);
    notifyListeners();
  }

  Future<void> saveGallery(bool value) async {
    _saveGallerys = value;
    await prefUtils.setBool(kGallery, value);
    notifyListeners();
  }

  Future<void> getGallery(String key) async {
    _saveGallerys = await prefUtils.getBool(key);
    notifyListeners();
  }

  // A map of custom color themes supported by the app
  final Map<String, ColorsSchemes> _supportedCustomColor = {
    kPrimary: PrimaryColors(),
    kDark: DarkColors(),
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    kPrimary: primaryColorScheme,
    kDark: darkColorScheme,
  };

  /// Returns the primary colors for the current theme.
  ColorsSchemes _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
        "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner",
      );
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    print("print it is ${_appTheme}");
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
        "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner",
      );
    }
    //return theme from map

    var colorScheme = _supportedColorScheme[_appTheme] ?? primaryColorScheme;

    if (_appTheme == kPrimary) {
      return ThemeData(
        visualDensity: VisualDensity.standard,
        colorScheme: colorScheme,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF0A10C2),
        ),
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: textTheme(colorScheme),
        scaffoldBackgroundColor: appTheme.whiteA700,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.h),
            ),
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
            padding: EdgeInsets.zero,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.primary;
            }
            return colorScheme.onSurface;
          }),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.primary;
            }
            return Colors.black;
          }),
          checkColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white;
            }
            return Colors.white;
          }),
          side: BorderSide(
            width: 1.5,
            color: const Color(0xFFFFFFFF).withOpacity(0.4),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: appTheme.gray90001,
        ),
        switchTheme: SwitchThemeData(
          overlayColor: MaterialStateProperty.all(const Color(0xFFEBEBEB)),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return appTheme.whiteA700; // Thumb color when switch is on
            }
            return const Color(0xFF080808);
          }),
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return theme.primaryColor; // Track color when switch is on
            }
            return const Color(0xFFEBEBEB); // Track color when switch is off
          }),
          trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: appTheme.whiteA700,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          space: 1,
          color: appTheme.gray200,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
        ),
      );
    } else {
      return ThemeData(
        visualDensity: VisualDensity.standard,
        colorScheme: colorScheme,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF0A10C2),
        ),
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: darkText(colorScheme),
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.h),
            ),
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
            padding: EdgeInsets.zero,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.primary;
            }
            return colorScheme.onSurface;
          }),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.primary;
            }
            return Colors.black;
          }),
          checkColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white;
            }
            return Colors.white;
          }),
          side: BorderSide(
            width: 1.5,
            color: const Color(0xFFFFFFFF).withOpacity(0.4),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: appTheme.gray90001,
        ),
        switchTheme: SwitchThemeData(
          overlayColor: MaterialStateProperty.all(const Color(0xFFEBEBEB)),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return appTheme.whiteA700; // Thumb color when switch is on
            }
            return const Color(0xFF080808);
          }),
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return theme.primaryColor; // Track color when switch is on
            }
            return const Color(0xFFEBEBEB); // Track color when switch is off
          }),
          trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          space: 1,
          color: const Color(0xFFFFFFFF).withOpacity(0.1),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xFF1A1A1A),
        ),
        // tabBarTheme:  TabBarTheme(),
      );
    }
  }

  /// Returns the primary colors for the current theme.
  ColorsSchemes themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();

  ColorsSchemes get appTheme => themeColor();
  ThemeData get theme => themeData();
}
