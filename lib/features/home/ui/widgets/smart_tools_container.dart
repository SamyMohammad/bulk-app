import 'package:bulk_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/styles.dart';

class SmartToolsContainer extends StatelessWidget {
  final String iconName;
  final String title;
  const SmartToolsContainer(
      {super.key, required this.iconName, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 90.w,
      decoration: BoxDecoration(
          color: ColorsManager.darkBackGround,
          borderRadius: BorderRadius.circular(10.sp)),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          SvgPicture.asset(iconName),
          Center(
            child: Text(
              title,
              style: TextStyles.font15whiteMedium.copyWith(fontSize: 13.sp),
              overflow: TextOverflow.clip,
              softWrap: true,
              
            ),
          )
        ],
      ),
    );
  }
}
