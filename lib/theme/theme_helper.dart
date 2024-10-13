import 'package:flutter/material.dart';
import '../core/app_export.dart';

String _appTheme = "lightCode";

LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };


  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onErrorContainer,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.onErrorContainer,
          side: BorderSide(
            color: appTheme.red50,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 22,
        space: 22,
        color: appTheme.gray90003,
      ),
    );
  }

// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class TextThemes {

  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: appTheme.gray10001,
      fontSize: 16.fSize,
      fontFamily: 'Nunito Sans',
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 15.fSize,
      fontFamily: 'Nunito Sans',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: appTheme.black900,
      fontSize: 12.fSize,
      fontFamily: 'Nunito Sans',
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      color: appTheme.gray900,
      fontSize: 52.fSize,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: appTheme.gray900,
      fontSize: 50.fSize,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: appTheme.gray900,
      fontSize: 28.fSize,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      color: appTheme.gray900,
      fontSize: 13.fSize,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 10.fSize,
      fontFamily: 'Nunito Sans',
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: appTheme.gray900,
      fontSize: 21.fSize,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: appTheme.gray900,
      fontSize: 17.fSize,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: appTheme.gray900,
      fontSize: 14.fSize,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w700,
    ),
  );
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF04CFF),
    primaryContainer: Color(0XFFF4F4F4),
    errorContainer: Color(0XFF003BE3),
    onError: Color(0XFFFF3333),
    onErrorContainer: Color(0XFFFFFFFF),
    onPrimary: Color(0XFF0B0B0B),
    onPrimaryContainer: Color(0XFF0C29B9),
  );
}
/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Black
  Color get black900 => Color(0xFF000000);

  // Blue
  Color get blue200 => Color(0xFF8BC6FF);

  Color get blue20001 => Color(0xFFAAC3FF);
  Color get blue50 => Color(0xFFD9E4FF);

  Color get blue5001 => Color(0xFFDFE9FF);
  Color get blue800 => Color(0xFF0042E0);

  Color get blueA700 => Color(0xFF0051FF);
  Color get blueA70001 => Color(0xFF004BFE);

  // BlueGray
  Color get blueGray100 => Color(0xFFD2D2D2);

  Color get blueGray10001 => Color(0xFFD9D9D9);
  Color get blueGray400 => Color(0xFF8D8D8D);
  Color get blueGray500 => Color(0xFFD9D9D9);

  // Cyan
  Color get cyan600 => Color(0xFFBCA889);

  // DeepOrange
  Color get deepOrange100 => Color(0xFFF28888);

  // Gray
  Color get gray100 => Color(0xFFF2F5FE);

  Color get gray10001 => Color(0xFFF3F3F3);
  Color get gray10002 => Color(0xFFF1F4FE);

  Color get gray10003 => Color(0xFFF5F5F5);
  Color get gray200 => Color(0xFFEBEBEB);

  Color get gray20001 => Color(0xFFEFEFEF);
  Color get gray20002 => Color(0xFFF1F0F0);

  Color get gray400 => Color(0xFFC6C6C6);
  Color get gray50 => Color(0xFFF4F6FE);

  Color get gray5001 => Color(0xFFF5F8FF);
  Color get gray5002 => Color(0xFFF8F8F8);

  Color get gray900 => Color(0xFF202020);
  Color get gray90001 => Color(0xFF231F20);

  Color get gray90002 => Color(0xFF2A2A2A);
  Color get gray90003 => Color(0xFF1E1E1E);

  // Green
  Color get greenA700 => Color(0xFF08C514);

  // Indigo
  Color get indigo100 => Color(0xFFCBD3EB);

  Color get indigo200 => Color(0xFF9EB4EB);
  Color get indigo400 => Color(0xFF59820A);

  Color get indigo50 => Color(0XFFE5EBFC);

  // LightGreen
  Color get lightGreenA200 => Color(0xFF9DEB44);

  // Orange
  Color get orange700 => Color(0xFFFE7F00);
  Color get orangeA700 => Color(0xFFFF5F00);

  // Pink
  Color get pink300 => Color(0xFFF5790);

  Color get pink400 => Color(0xFFF34075);

  // Purple
  Color get purple400 => Color(0xFF9D3CB9);

  // Red
  Color get red200 => Color(0xFFD97474);
  Color get red300 => Color(0xFFF1AEAE);

  Color get red50 => Color(0xFFFEBEB);

  Color get redA400 => Color(0xFFF81140);
  Color get redA700 => Color(0xFFEB0018);

  // Yellow
  Color get yellow700 => Color(0xFFE98832);

  Color get yellow800 => Color(0xFFE4A719);
  Color get yellow80001 => Color(0xFFF79E18);

  Color get yellow80002 => Color(0xFFF1811C);
  Color get yellow80003 => Color(0xFFECA618);
}