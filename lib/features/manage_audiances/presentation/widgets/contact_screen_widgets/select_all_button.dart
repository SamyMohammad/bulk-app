import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
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
          borderRadius: BorderRadius.circular(50.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
        child: Text(
          AppStrings.selectAll.tr(),
          style: TextStyles.font15whiteMedium.copyWith(
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
