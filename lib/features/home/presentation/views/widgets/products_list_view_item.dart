import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/app_constants/app_gaps.dart';
import 'package:link_development_task/core/app_constants/app_radius.dart';
import 'package:link_development_task/core/app_constants/app_spaces.dart';
import 'package:link_development_task/core/app_constants/size_config.dart';
import 'package:link_development_task/core/app_widgets/custom_load_indicator.dart';
import 'package:link_development_task/core/theme/app_colors.dart';
import 'package:link_development_task/features/home/data/models/products_model/products_datum.dart';
//import 'package:intl/intl.dart';

class ProductsListViewItem extends StatelessWidget {
  final ProductsDatum product;
  final int index;

  const ProductsListViewItem(
      {super.key, required this.product, required this.index});
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    //String formattedPrice = NumberFormat('#,##0').format(product.price);

    return Container(
        // width: 117.w,
        margin: EdgeInsets.symmetric(horizontal: AppSpaces.padding6W),
        alignment: Alignment.center,
        padding: EdgeInsets.all(AppSpaces.smallPadding.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
          border: Border.all(color: AppColors.kBorderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CachedNetworkImage(
                imageUrl: product.image ?? "",
                height: 100.h,
                width: 100.w,
                placeholder: (context, url) => const CustomLoadIndicator(),
                errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.kIconColor,
                    )),
            AppGaps.smallGapH,
            SizedBox(
              width: width * 0.268.w, //105.w,
              child: Text(
                product.name ?? "",
                textAlign: TextAlign.end,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 10.sp),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 6.h, bottom: 4.h),
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 10.sp, color: AppColors.kIconColor),
                    children: [
                      TextSpan(
                        text: '${product.price} ',
                      ),
                      const TextSpan(
                        text: 'ريال سعودي',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.rtl,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("${product.storeName} من",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 10.sp, color: AppColors.kBodyColor)),
                AppGaps.xSmallGapW,
                Container(
                  width: 24.w,
                  height: 24.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                      imageUrl: product.storeImage ?? "",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const CustomLoadIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: AppColors.kPrimaryColor,
                          )),
                ),
              ],
            ),
          ],
        ));
  }
}
