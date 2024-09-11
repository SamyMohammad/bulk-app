import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget widget;
  const CustomContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: 20.w, vertical: 20.h), // Use ScreenUtil if applicable
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorsManager
                .saerchTextFieldHintColor, // Use your color manager or direct color
          ),
          borderRadius:
              BorderRadius.circular(17.r), // Use ScreenUtil if applicable
          color: ColorsManager
              .darkAppBarBackGround, // Use your color manager or direct color
        ),
        child: widget);
  }
}
