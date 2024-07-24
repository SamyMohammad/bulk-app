import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAllButton extends StatelessWidget {
  const SelectAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.teal400,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
        child: Text(
          "Select All",
          style: TextStyles.font15whiteMedium.copyWith(
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
