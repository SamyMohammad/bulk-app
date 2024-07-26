import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
//
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
final double? borderRadius;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? label;
  final int? maxLine;
  const AppTextField({
    super.key,
    this.borderRadius,
    this.contentPadding,
    this.maxLine = 1,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.prefixIcon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLine,
      decoration: InputDecoration(
        isDense: false,
        label: label != null ? Text(label!) : null,
        labelStyle: TextStyles.font15whiteMedium.copyWith(
            color: ColorsManager.saerchTextFieldHintColor, fontSize: 17.sp),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.saerchTextFieldHintColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(borderRadius?? 30.r),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.saerchTextFieldHintColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(borderRadius?? 30.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(borderRadius?? 30.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.saerchTextFieldHintColor,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(borderRadius?? 30.r),
        ),
        hintStyle: hintStyle ??
            TextStyles.font15whiteMedium.copyWith(
                color: ColorsManager.saerchTextFieldHintColor, fontSize: 20.sp),
        // ??
        //  TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: ColorsManager.saerchTextFieldColor,
        prefixIcon: prefixIcon,
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