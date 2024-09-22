import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link_development_task/core/app_constants/app_gaps.dart';
import 'package:link_development_task/core/app_constants/app_images.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/app_constants/styles.dart';

class CustomRowTitles extends StatelessWidget {
  final String title;
  final bool isBestSeller;

  const CustomRowTitles(
      {super.key, required this.title, this.isBestSeller = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpaces.xMediumPadding.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("عرض الكل", style: Styles.textStyle12),
          Row(
            children: [
              isBestSeller
                  ? SvgPicture.asset(AppImages.bestSellerIcon)
                  : const SizedBox(),
              AppGaps.smallGapW,
              Text(title, style: Styles.textStyle20),
            ],
          ),
        ],
      ),
    );
  }
}
