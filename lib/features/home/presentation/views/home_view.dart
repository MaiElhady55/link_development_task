import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/app_constants/app_gaps.dart';
import 'package:link_development_task/core/app_constants/app_images.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/app_constants/size_config.dart';
import 'package:link_development_task/core/app_constants/styles.dart';
import 'package:link_development_task/core/app_widgets/custom_load_indicator.dart';
import 'package:link_development_task/core/di/service_loctor.dart';
import 'package:link_development_task/core/theme/app_colors.dart';
import 'package:link_development_task/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:link_development_task/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:link_development_task/features/home/presentation/views/widgets/custom_row_titles.dart';
import 'package:link_development_task/features/home/presentation/views/widgets/home_no_connection_view.dart';
import 'package:link_development_task/features/home/presentation/views/widgets/home_slider.dart';
import 'package:link_development_task/features/home/presentation/views/widgets/products_list_view.dart';
import 'package:link_development_task/features/home/presentation/views/widgets/stores_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..loadHomeData(),
      child: SafeArea(
        child: Scaffold(
            appBar: customAppBar(context),
            body: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is HomeLoading ||
                    current is HomeFailure ||
                    current is HomeNoConnection ||
                    current is HomeSuccess,
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomLoadIndicator(),
                        AppGaps.mediumGapH,
                        Text(
                          'جار التحميل',
                          style: Styles.textStyle14(AppColors.kHeadlineColor),
                        ),
                        AppGaps.mediumGapH,
                      ],
                    ));
                  } else if (state is HomeNoConnection) {
                    return const HomeNoConnectionView();
                  } else if (state is HomeFailure) {
                    return Center(
                        child: Text(
                      state.errorMessage,
                      style: Styles.textStyle14Bold
                          .copyWith(color: AppColors.kHeadlineColor),
                    ));
                  } else if (state is HomeSuccess) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          AppGaps.smallGapH,
                          const HomeSlider(),
                          AppGaps.xLargGapH,
                          const CustomRowTitles(title: "تسوق حسب المتاجر"),
                          AppGaps.xMediumGapH,
                          const StoresListView(),
                          AppGaps.xLargGapH,
                          const CustomRowTitles(title: "آخر قراءات الباركود"),
                          AppGaps.xMediumGapH,
                          const ProductsListView(),
                          AppGaps.xLargGapH,
                          const CustomRowTitles(title: "أحدث المنتجات"),
                          AppGaps.xMediumGapH,
                          const ProductsListView(),
                          AppGaps.xLargGapH,
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSpaces.xMediumPadding.w),
                            child: Image.asset(
                              AppImages.banner,
                              fit: BoxFit.cover,
                              width: width,
                            ),
                          ),
                          AppGaps.xLargGapH,
                          const CustomRowTitles(
                              title: "المنتجات الأكثر مشاهدة"),
                          AppGaps.xMediumGapH,
                          const ProductsListView(),
                          AppGaps.xLargGapH,
                          const CustomRowTitles(
                            title: "المنتجات الأكثر مبيعا",
                            isBestSeller: true,
                          ),
                          AppGaps.xMediumGapH,
                          const ProductsListView(),
                          AppGaps.xMediumGapH,
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                })),
      ),
    );
  }
}
