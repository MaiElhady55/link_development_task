import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/theme/app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Tajawal',
    scaffoldBackgroundColor: AppColors.kAccentColor,
    brightness: Brightness.light,
    primaryColor: AppColors.kPrimaryColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.kHeadlineColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: AppColors.kHeadlineColor),
      bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kBodyColor),
      displayMedium: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.kHeadlineColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kAccentColor,
      elevation: 0.0,
    ),
  );
}
