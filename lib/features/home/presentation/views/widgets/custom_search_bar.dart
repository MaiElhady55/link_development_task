import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_development_task/core/app_constants/app_images.dart';
import 'package:link_development_task/core/app_constants/app_radius.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/theme/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
      textAlign: TextAlign.right,
      cursorHeight: 24.h,
      cursorColor: AppColors.kPrimaryColor,
      decoration: InputDecoration(
        hintText: "ما الذي تبحث عنه؟",
        hintStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.kBodyColor),
        contentPadding: EdgeInsetsDirectional.all(AppSpaces.padding14.w),
        suffixIcon: Padding(
          padding: EdgeInsets.all(AppSpaces.mediumPadding.w),
          child: SvgPicture.asset(AppImages.search),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kIconColor),
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
          borderSide: const BorderSide(
            color: AppColors.kBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
          borderSide: const BorderSide(
            color: AppColors.kBorderColor,
          ),
        ),
      ),
    ));
  }
}
