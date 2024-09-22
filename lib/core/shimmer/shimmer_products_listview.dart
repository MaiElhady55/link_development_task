import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/app_constants/size_config.dart';
import 'package:link_development_task/core/shimmer/shimmer_container_effect.dart';

class ShimmerProductsListView extends StatelessWidget {
  const ShimmerProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.height(context);

    return SizedBox(
      height: height * 0.28.h, //212.h,
      child: ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.padding18.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ShimmerContainerEffect(
            width: 117.w,
            margin: EdgeInsets.symmetric(horizontal: AppSpaces.padding6W),
          );
        },
      ),
    );
  }
}
