import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/account_settings/widgets/account_information_box.dart';
import 'package:bulk_app/features/account_settings/widgets/current_account_box.dart';
import 'package:bulk_app/features/account_settings/widgets/license_days_box.dart';
import 'package:bulk_app/features/account_settings/widgets/settings_row1.dart';
import 'package:bulk_app/features/account_settings/widgets/settings_row2.dart';
import 'package:bulk_app/features/account_settings/widgets/settings_row3.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSettingsScreenBody extends StatelessWidget {
  const AccountSettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CurrentAccount(number: "+201000000000"),
          Text(
            AppStrings.licenseDays.tr(),
            style: TextStyles.font15whiteMedium,
          ),
          const LicenseDays(days: '152'),
          SizedBox(height: 12.h),
          Text(
            AppStrings.accountInformation.tr(),
            style: TextStyles.font15whiteMedium.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),
          AccountInformation(
            imagePath: "assets/icons/account_box.svg",
            infoNumber: 58,
            info: AppStrings.contacts.tr(),
          ),
          SizedBox(height: 5.h),
          AccountInformation(
            imagePath: "assets/icons/diversity_3.svg",
            infoNumber: 3,
            info: AppStrings.groups.tr(),
          ),
          SizedBox(height: 15.h),
          Text(
            AppStrings.generalSettings.tr(),
            style: TextStyles.font15whiteMedium.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 14.w),
            child: Column(children: [
              const SettingsRow1(),
              SizedBox(height: 25.h),
              const SettingsRow2(),
            ]),
          ),
          SizedBox(height: 12.h),
          Text(
            AppStrings.advanced.tr(),
            style: TextStyles.font15whiteMedium.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 12.h),
          const SettingsRow3(),
        ],
      ),
    );
  }
}
