import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/theme/app_colors.dart';

class CustomLoadIndicator extends StatelessWidget {
  const CustomLoadIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: AppSpaces.imageIconSize.w,
      height: AppSpaces.imageIconSize.h,
      child: const CircularProgressIndicator(
        color: AppColors.kPrimaryColor,
      ),
    ));
  }
}
