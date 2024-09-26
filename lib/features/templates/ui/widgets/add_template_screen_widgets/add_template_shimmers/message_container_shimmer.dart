import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/theming/colors.dart';

class MessageContainerShimmer extends StatelessWidget {
  const MessageContainerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.saerchTextFieldHintColor,
      highlightColor: Colors.white,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: ColorsManager.saerchTextFieldHintColor,
            ),
            borderRadius: BorderRadius.circular(17.r),
            color: ColorsManager.darkAppBarBackGround),
      ),
    );
  }
}
