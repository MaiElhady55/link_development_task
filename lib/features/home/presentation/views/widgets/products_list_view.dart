import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/app_constants/size_config.dart';
import 'package:link_development_task/core/di/service_loctor.dart';
import 'package:link_development_task/core/shimmer/shimmer_products_listview.dart';
import 'package:link_development_task/features/home/presentation/view_models/products_cubit/products_cubit.dart';
import 'package:link_development_task/features/home/presentation/views/widgets/products_list_view_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.height(context);

    return BlocProvider(
      create: (context) =>
          getIt<ProductsCubit>()..fetchProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        buildWhen: (previous, current) =>
            current is ProductsLoading ||
            current is ProductsFailure ||
            current is ProductsSuccess,
        builder: (context, state) {
          if (state is ProductsSuccess) {
            return SizedBox(
              height: height * 0.288.h, //212.h,
              
              child: ListView.builder(
                itemCount: state.products.length,
                padding:
                    EdgeInsets.symmetric(horizontal: AppSpaces.padding18.w),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductsListViewItem(
                    product: state.products[index],
                    index: index,
                  );
                },
              ),
            );
          } else if (state is ProductsFailure) {
            return Text(
              state.errMessage,
              textAlign: TextAlign.center,
            );
          }
          return const ShimmerProductsListView();
        },
      ),
    );
  }
}
