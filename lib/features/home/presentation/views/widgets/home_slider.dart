import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/app_constants/app_gaps.dart';
import 'package:link_development_task/core/app_constants/app_radius.dart';
import 'package:link_development_task/core/app_widgets/custom_load_indicator.dart';
import 'package:link_development_task/core/di/service_loctor.dart';
import 'package:link_development_task/core/shimmer/shimmer_home_slider.dart';
import 'package:link_development_task/core/theme/app_colors.dart';
import 'package:link_development_task/features/home/presentation/view_models/banners_cubit/banners_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselSliderController _controller = CarouselSliderController();

    return BlocProvider(
      create: (context) => getIt<BannersCubit>()..fetchBanners(),
      //BannersCubit(getIt.get<HomeRepoImpl>())..fetchBanners(),
      child: BlocBuilder<BannersCubit, BannersState>(
        buildWhen: (previous, current) =>
            current is BannersLoading ||
            current is BannersFailure ||
            current is BannersSuccess ||
            current is BannersChangeIndexState,
        builder: (context, state) {
          if (state is BannersSuccess) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: state.banners.length,
                  carouselController: _controller,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.baseRadius),
                    child: CachedNetworkImage(
                      imageUrl: state.banners[itemIndex].image ?? "",
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          const CustomLoadIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: AppColors.kIconColor,
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 180.h,
                    aspectRatio: 24 / 10,
                    initialPage: 0,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.80,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.15,
                    reverse: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    onPageChanged: (index, reason) {
                      context.read<BannersCubit>().changeBannersIndex(index);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                AppGaps.smallGapH,
                AnimatedSmoothIndicator(
                  activeIndex: state.currentIndex,
                  onDotClicked: (index) => _controller.animateToPage(index),
                  count: state.banners.length,
                  effect: CustomizableEffect(
                    spacing: 6,
                    activeDotDecoration: DotDecoration(
                      width: 8,
                      height: 8,
                      color: AppColors.kPrimaryColor,
                      borderRadius:
                          BorderRadius.circular(AppRadius.xSmallRadius),
                    ),
                    dotDecoration: DotDecoration(
                      width: 8,
                      height: 8,
                      color: AppColors.kAccentColor,
                      borderRadius:
                          BorderRadius.circular(AppRadius.xSmallRadius),
                      dotBorder: const DotBorder(
                          color: AppColors.kIndicatorBorderColor, width: 0.67),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is BannersFailure) {
            return Text(
              state.errMessage,
              textAlign: TextAlign.center,
            );
          }
          return const ShimmerHomeSlider();
        },
      ),
    );
  }
}
