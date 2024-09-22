import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/theme/app_colors.dart';

abstract class Styles {
  static TextStyle textStyle14Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14.sp,
      color: AppColors.kAccentColor);

  static TextStyle textStyle20 = TextStyle(
      color: AppColors.kHeadlineColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500);

  static TextStyle textStyle12 = TextStyle(
      color: AppColors.kPrimaryColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700);

  static TextStyle textStyle14(Color color) =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color);

  static BoxShadow buttonShadow = const BoxShadow(
      offset: Offset(0, 10),
      blurRadius: 30,
      spreadRadius: 0,
      color: AppColors.buttonShadowColor);
}
