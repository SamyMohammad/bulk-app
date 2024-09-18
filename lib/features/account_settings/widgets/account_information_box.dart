import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation(
      {super.key,
      required this.imagePath,
      required this.infoNumber,
      required this.info});
  final int infoNumber;
  final String imagePath, info;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.sp),
        color: ColorsManager.teal400,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Row(
          children: [
            VectorGraphic(loader: AssetBytesLoader(imagePath)),
            SizedBox(width: 12.w),
            Text(
              info,
              style: TextStyles.font14darkrBold.copyWith(fontSize: 18.sp),
            ),
            const Spacer(),
            Text(
              infoNumber.toString(),
              style: TextStyles.font14darkrBold.copyWith(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
