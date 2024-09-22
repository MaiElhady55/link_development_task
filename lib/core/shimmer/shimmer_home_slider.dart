import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/core/app_constants/size_config.dart';
import 'package:link_development_task/core/shimmer/shimmer_container_effect.dart';

class ShimmerHomeSlider extends StatelessWidget {
  const ShimmerHomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
var height = SizeConfig.height(context);
    return ShimmerContainerEffect(
      width: width*0.85.w,
      height: height*0.222.h//165.h,
    
    );
  }
}
