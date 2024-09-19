import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

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
            AppStrings.clearCachedData.tr(),
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
                child: const VectorGraphic(
                  loader: AssetBytesLoader(
                    'assets/icons/delete_forever.svg',
                  ),
                )),
          )
        ]));
  }
}
