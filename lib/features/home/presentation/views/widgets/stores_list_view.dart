import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_development_task/core/app_constants/app_gaps.dart';
import 'package:link_development_task/core/app_constants/app_images.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/app_constants/size_config.dart';
import 'package:link_development_task/core/theme/app_colors.dart';

class StoresListView extends StatelessWidget {
  const StoresListView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.height(context);

    return SizedBox(
      height: height * 0.085, //80.h,
      child: ListView.separated(
        itemCount: 8,
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.mediumPadding.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            width: 80.w,
            height: 80.h,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.kBackgroundColor),
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSpaces.padding10.w),
                child: SvgPicture.asset(AppImages.amazon),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return AppGaps.smallGapW;
        },
      ),
    );
  }
}
