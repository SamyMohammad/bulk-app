import 'package:bulk_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../core/theming/styles.dart';

class SmartToolsContainer extends StatelessWidget {
  final String iconName;
  final String title;
  final bool isCampaginHistory;
  final VoidCallback? onTap;
  const SmartToolsContainer(
      {super.key,
      required this.isCampaginHistory,
      required this.iconName,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManager.darkBackGround,
      borderRadius: BorderRadius.circular(10.sp),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.sp),
          onTap: onTap,
          child: Container(
            height: 90.h,
            width: 90.w,
            alignment: Alignment.center,
            // padding: EdgeInsets.all(10.sp),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                VectorGraphic(
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  height: isCampaginHistory ? 25.h : null,
                  width: isCampaginHistory ? 25.w : null,
                  loader: AssetBytesLoader(
                    iconName,
                  ),
                ),
                if (isCampaginHistory) SizedBox(height: 5.h),
                // const Spacer(),
                Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style:
                        TextStyles.font15whiteMedium.copyWith(fontSize: 13.sp),
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    textScaler: const TextScaler.linear(1),
                  ),
                ),
                if (isCampaginHistory) SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
