import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/account_settings/logic/cubit/account_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsRow1 extends StatelessWidget {
  const SettingsRow1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Signature",
          style: TextStyles.font15whiteMedium.copyWith(
            color: ColorsManager.limeColor,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset("assets/icons/edit_square.svg",
                width: 20.w, height: 20.h),
            SizedBox(width: 8.w),
            FlutterSwitch(
              width: 50.w,
              height: 25.h,
              toggleSize: 18.r,
              value: context.watch<AccountSettingsCubit>().signature,
              borderRadius: 30.r,
              activeColor: ColorsManager.limeColor,
              inactiveColor: ColorsManager.saerchTextFieldHintColor,
              onToggle: (val) {
                context.read<AccountSettingsCubit>().switchSignature();
              },
            )
          ],
        ),
      ],
    );
  }
}
