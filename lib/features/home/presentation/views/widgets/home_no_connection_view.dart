import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/app_constants/app_gaps.dart';
import 'package:link_development_task/core/app_constants/app_radius.dart';
import 'package:link_development_task/core/app_constants/styles.dart';
import 'package:link_development_task/core/theme/app_colors.dart';
import 'package:link_development_task/features/home/presentation/view_models/home_cubit/home_cubit.dart';

class HomeNoConnectionView extends StatelessWidget {
  const HomeNoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 120.w,
              height: 120.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.kBackgroundColor),
              child: Icon(
                Icons.wifi_off,
                size: 60.w,
                color: AppColors.kPrimaryColor,
              )),
          AppGaps.xMediumGapH,
          Text(
            'لا يوجد اتصال بالانترنت، يرجي الاتصال بالانترنت',
            style: Styles.textStyle14Bold
                .copyWith(color: AppColors.kHeadlineColor),
          ),
          AppGaps.xMediumGapH,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.smallRadius),
              ),
            ),
            onPressed: () {
              //context.read<HomeCubit>().loadHomeData();
              context.read<HomeCubit>().retryLoading(); 
            },
            child: Text(
              'إعادة المحاولة',
              style: Styles.textStyle14Bold,
            ),
          ),
        ],
      ),
    );
  }
}
