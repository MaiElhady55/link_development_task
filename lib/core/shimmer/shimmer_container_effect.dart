import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/app_constants/app_radius.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerContainerEffect extends StatelessWidget {
  const ShimmerContainerEffect({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.margin,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      child: Container(
        margin: margin,
        width: width,
        height: height ?? 1.2.h,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppRadius.baseRadius),
        ),
      ),
    );
  }
}
