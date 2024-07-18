import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
//
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;

  const AppSearchField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: false,

        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.saerchTextFieldHintColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(30.r),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.saerchTextFieldHintColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(30.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(30.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.saerchTextFieldHintColor,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(30.r),
        ),
        hintStyle: hintStyle ??
            TextStyles.font15whiteMedium.copyWith(
                color: ColorsManager.saerchTextFieldHintColor, fontSize: 20.sp),
        // ??
        //  TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: ColorsManager.saerchTextFieldColor,
        prefixIcon: Icon(
          Icons.search,
          size: 25.sp,
          color: ColorsManager.saerchTextFieldHintColor,
        ),
        // ?? ColorsManager.moreLightGray,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font15whiteMedium.copyWith(
          fontSize: 20.sp,
          decoration: TextDecoration.none,
          decorationThickness: 0),
    );
  }
}
