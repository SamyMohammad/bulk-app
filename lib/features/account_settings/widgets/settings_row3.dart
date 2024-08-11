import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsRow3 extends StatelessWidget {
  const SettingsRow3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.w),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Clear Cached data",
            style: TextStyles.font15whiteMedium.copyWith(
              color: ColorsManager.limeColor,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.saerchTextFieldBackGroundColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(3.r),
              child: SvgPicture.asset("assets/icons/delete_forever.svg"),
            ),
          )
        ]));
  }
}
