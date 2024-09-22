import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_development_task/core/app_constants/app_gaps.dart';
import 'package:link_development_task/core/app_constants/app_images.dart';
import 'package:link_development_task/core/app_constants/app_radius.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/app_constants/size_config.dart';
import 'package:link_development_task/core/theme/app_colors.dart';
import 'package:link_development_task/features/home/presentation/views/widgets/custom_search_bar.dart';

PreferredSizeWidget customAppBar(BuildContext context) {
  var width = SizeConfig.width(context);
  return AppBar(
    toolbarHeight: width * 0.44.h, // 156,
    scrolledUnderElevation: 0,
    title: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppSpaces.mediumPadding.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppImages.cart,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImages.arrow,
                      width: AppSpaces.imageIconSize.w,
                      height: AppSpaces.imageIconSize.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSpaces.smallPadding.w),
                    child: Text("تبوك, منطقة تبوك",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  SvgPicture.asset(
                    AppImages.map,
                    width: AppSpaces.imageIconSize.w,
                    height: AppSpaces.imageIconSize.h,
                  ),
                ],
              )
            ],
          ),
        ),
        AppGaps.largeGapH,
        Row(
          children: [
            Container(
              width: 43.w,
              height: 48.h,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  vertical: AppSpaces.padding10.h,
                  horizontal: AppSpaces.smallPadding.w),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(AppRadius.smallRadius),
              ),
              child: SvgPicture.asset(AppImages.qrCode),
            ),
            AppGaps.mediumGapH,
            const CustomSearchBar()
          ],
        ),
      ],
    ),
  );
}
