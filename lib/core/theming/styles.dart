import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
    // fontFamily: 'Tajawal'
  );
  static TextStyle font16GreenExtraBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: ColorsManager.containerTitleColor,
    // fontFamily: 'Tajawal'
  );
  static TextStyle font14darkrBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.darkAppBarBackGround,
    // fontFamily: 'Tajawal'
  );
  static TextStyle font15whiteMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
    // fontFamily: 'Tajawal'
  );

  static TextStyle font12witeRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
    // fontFamily: 'Tajawal'
  );
  static TextStyle font26whiteRegular = TextStyle(
    color: Colors.white,
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.regular,
    // fontFamily: 'Tajawal'
  );
  static TextStyle font24limeExtraBold = TextStyle(
    fontSize: 24.sp,
    color: ColorsManager.limeColor,
    fontWeight: FontWeight.w800,
    // fontFamily: 'Tajawal'
  );
  static TextStyle font15limeExtraBold = TextStyle(
    fontSize: 18.sp,
    color: ColorsManager.limeColor,
    fontWeight: FontWeight.w400,
    // fontFamily: 'Tajawal'
  );
}
