import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_development_task/core/app_constants/app_gaps.dart';
import 'package:link_development_task/core/app_constants/app_radius.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/app_constants/size_config.dart';
import 'package:link_development_task/core/app_constants/styles.dart';
import 'package:link_development_task/core/theme/app_colors.dart';
import 'package:link_development_task/features/layout/presentation/view_models/layout_cubit/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    double displayWidth = SizeConfig.width(context);
    var layoutCubit = BlocProvider.of<LayoutCubit>(context);

    return Scaffold(
      body: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return layoutCubit.pages[layoutCubit.currentIndex];
        },
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.only(
              right: AppSpaces.xMediumPadding.w,
              left: AppSpaces.xMediumPadding.w,
              bottom: AppSpaces.xLargePadding.h),
          height: 62.h,
          decoration: BoxDecoration(
            color: AppColors.kAccentColor,
            borderRadius: BorderRadius.circular(AppRadius.bottomNavBarRadius),
            border: Border.all(color: AppColors.kBottomBorderColor, width: 0.2),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0,
                color: AppColors.kBottomShadowColor,
              )
            ],
          ),
          child: BlocBuilder<LayoutCubit, LayoutState>(
            builder: (context, state) {
              int selectedIndex = layoutCubit.currentIndex;
              if (state is ChangeIndexState) {
                selectedIndex = state.index;
              }
              return ListView.builder(
                  itemCount: layoutCubit.bottomTabs.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    right: AppSpaces.padding10.w,
                    left: AppSpaces.xMediumPadding.w,
                  ),
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        layoutCubit.onPageChange(index);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: isSelected
                                ? displayWidth * .30
                                : displayWidth * .18,
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSpaces.smallPadding.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.kPrimaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                    AppRadius.bottomNavBarRadius),
                              ),
                            ),
                          ),
                          Container(
                            width: isSelected
                                ? displayWidth * .28
                                : displayWidth * .18,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    isSelected
                                        ? layoutCubit.bottomTabs[index].title
                                        : '',
                                    textAlign: TextAlign.center,
                                    style: Styles.textStyle14Bold),
                                AppGaps.smallGapH,
                                SvgPicture.asset(
                                  width: 28.w,
                                  height: 28.h,
                                  layoutCubit.bottomTabs[index].image,
                                  color: isSelected
                                      ? AppColors.kAccentColor
                                      : AppColors.kHeadlineColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
