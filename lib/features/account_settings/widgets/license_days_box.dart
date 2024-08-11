import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LicenseDays extends StatelessWidget {
  const LicenseDays({super.key, required this.days});
  final String days;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.sp),
        color: ColorsManager.buttonColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Text("$days Left",
            style: TextStyles.font15whiteMedium
                .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
