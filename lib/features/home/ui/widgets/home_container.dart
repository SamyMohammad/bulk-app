import 'package:animate_do/animate_do.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class HomeContainer extends StatelessWidget {
  final String title;
  final Widget body;
  final AlignmentGeometry? alignment;
  final double? heightContainer;
  final int? animationDuration ;
   final double? fromAnimation ; 
  const HomeContainer({
    required this.title,
    required this.body,
    this.animationDuration,
    this.heightContainer,
    this.alignment,
    this.fromAnimation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      animate: true,
      delay:  Duration(milliseconds: animationDuration ?? 2000
      ),
      // duration:  Duration(milliseconds: animationDuration ?? 1500),
      from: fromAnimation ?? 75,
      child: Container(
        height: heightContainer ?? context.height * .2,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.sp),
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp)),
          color: ColorsManager.darkAppBarBackGround,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.font16GreenExtraBold,
            ),
            Container(alignment: alignment, child: body),
          ],
        ),
      ),
    );
  }
}
