import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class CurrentAccount extends StatelessWidget {
  const CurrentAccount({super.key, required this.number});
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.sp),
        color: ColorsManager.limeColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Row(
          children: [
            const VectorGraphic(
                loader: AssetBytesLoader("assets/icons/whatssapp.svg")),
            SizedBox(width: 15.w),
            const VectorGraphic(
                loader: AssetBytesLoader("assets/icons/line.svg")),
            SizedBox(width: 25.w),
            Text(
              number,
              style: TextStyles.font24BlackBold.copyWith(fontSize: 20.sp),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
              iconSize: 28.r,
            )
          ],
        ),
      ),
    );
  }
}
