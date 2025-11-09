import 'package:crud/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextTheme lightTextTheme = GoogleFonts.interTextTheme().copyWith(
    displayLarge: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      color: Colors.grey,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(color: Colors.grey, fontSize: 16), // subtle text
    bodyLarge: TextStyle(color: Colors.black, fontSize: 20),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  static final TextTheme darkTextTheme = GoogleFonts.interTextTheme().copyWith(
    displayLarge: TextStyle(
      color: AppColors.darkPrimary,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      color: AppColors.darkPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      color: AppColors.darkText2,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: AppColors.darkText2,
      fontSize: 16,
    ), // subtle text
    bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.lightPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.lightText),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightPrimary,
    ),
    textTheme: lightTextTheme,
    cardColor: AppColors.white,

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(AppColors.lightPrimary),
      trackColor: WidgetStatePropertyAll(
        AppColors.lightPrimary.withOpacity(0.3),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.darkPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkText),
    ),
    textTheme: darkTextTheme,
    cardColor: AppColors.black,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkPrimary,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(AppColors.darkPrimary),
      trackColor: WidgetStatePropertyAll(
        AppColors.darkPrimary.withOpacity(0.3),
      ),
    ),
  );
}
