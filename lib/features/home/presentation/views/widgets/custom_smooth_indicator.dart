import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:link_development_task/core/app_constants/app_radius.dart';
import 'package:link_development_task/core/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothIndicator extends StatelessWidget {
  final int currentIndex;
  final CarouselSliderController controller;

  const CustomSmoothIndicator(
      {super.key, required this.currentIndex, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
        activeIndex: currentIndex,
        onDotClicked: (index) => controller.animateToPage(index),
        count: 4,
        effect: CustomizableEffect(
          spacing: 6,
          activeDotDecoration: DotDecoration(
            width: 8,
            height: 8,
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(AppRadius.xSmallRadius),
          ),
          dotDecoration: DotDecoration(
            width: 8,
            height: 8,
            color: AppColors.kAccentColor,
            borderRadius: BorderRadius.circular(AppRadius.xSmallRadius),
            dotBorder: const DotBorder(
                color: AppColors.kIndicatorBorderColor, width: 0.67),
          ),
        ));
  }
}
