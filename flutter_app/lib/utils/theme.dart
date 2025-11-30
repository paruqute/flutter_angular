import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messaging_app/utils/style.dart';


import 'color.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: scaffoldBgColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,        // Primary color
      onPrimary: Colors.white,           // Text on primary
      secondary: secondaryColor,      // Secondary
      onSecondary: accentColor,     // Background color
// onBackground: Color(0xff0D0D12),   // Text on background
      surface: Color(0xffF5F5F5),        // Cards, sheets, etc.
      onSurface: Color(0xff0D0D12),      // Text on surface
      error: Colors.red,
      onError: Colors.white,
      tertiary: hintColor,       // Accent/hint
      onTertiary: Colors.white,
    ),
bottomAppBarTheme: BottomAppBarThemeData(
  elevation: 1,
  color: primaryColor,surfaceTintColor: primaryColor

),
      appBarTheme: AppBarThemeData(
        backgroundColor: primaryColor,
        elevation: 1,
        foregroundColor: backgroundColor,
        titleTextStyle: mediumText.copyWith(
          fontSize: 18.sp,
          //height: 16.sp,
          color: backgroundColor,
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: semiBoldText, //24 size 30 height

        ///Medium
        titleSmall: mediumText,
        //14 & 20 height
        labelMedium: mediumText.copyWith(
          fontSize: 12.sp,
          //height: 16.sp,
          color: hintColor2,
        ),
        titleLarge:mediumText.copyWith(
          fontSize: 20.sp,
          //height: 24.sp,

        ),
        titleMedium: mediumText.copyWith(
          fontSize: 16.sp,
          // height: 24.sp,
          color: accentColor,
        ),

        ///regular
        bodyMedium: regularText, //14 & 20 height
        bodySmall: regularText.copyWith(fontSize: 12.sp,
          // height: 16.sp,
        ),
      ),
  );
}