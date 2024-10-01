import 'package:bulk_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? iconPath;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  const CustomButton._internal(
      {super.key,
      required this.text,
      this.padding,
      this.textColor,
      required this.onPressed,
      this.iconPath,
      this.fontSize,
      this.backgroundColor});

  // Factory constructor for button with an icon
  factory CustomButton.withIcon({
    required String text,
    required VoidCallback onPressed,
    required String iconPath,
    double? fontSize,
    EdgeInsetsGeometry? padding,
    Color? textColor,
    Color? backgroundColor,
    Key? key,
  }) {
    return CustomButton._internal(
      key: key,
      text: text,
      padding: padding,
      fontSize: fontSize,
      onPressed: onPressed,
      iconPath: iconPath,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  // Factory constructor for button without an icon
  factory CustomButton.withoutIcon({
    required String text,
    required VoidCallback onPressed,
    double? fontSize,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    Color? textColor,
    Key? key,
  }) {
    return CustomButton._internal(
      key: key,
      text: text,
      fontSize: fontSize,
      onPressed: onPressed,
      textColor: textColor,
      padding: padding,
      backgroundColor: backgroundColor,
    );
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorsManager.buttonColor,
          minimumSize: Size.zero,
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 9.h, horizontal: 0),
        ),
        label: Text(
          text,
          style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: fontSize?.sp ?? 11.sp),
        ),
        icon: iconPath == null
            ? null
            : VectorGraphic(
                height: 16.h,
                width: 10.w,
                loader: AssetBytesLoader(
                  iconPath!,
                ),
              ));
  }
}
