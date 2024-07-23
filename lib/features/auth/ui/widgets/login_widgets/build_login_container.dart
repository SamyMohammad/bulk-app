import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/core/widgets/app_text_field.dart';
import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildLoginContainer extends StatelessWidget {
  const BuildLoginContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
          color: ColorsManager.darkAppBarBackGround,
          borderRadius: const BorderRadius.all(
            Radius.circular(21),
          ),
          border: Border.all(color: ColorsManager.saerchTextFieldHintColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppStrings.login.tr(),
            style: TextStyles.font16GreenExtraBold,
          ),
          15.verticalSpace,
          AppTextField(
            hintText: AppStrings.emailID.tr(),
            borderRadius: 15,
            hintTextColor: ColorsManager.containerTitleColor,
          ),
          15.verticalSpace,
          AppTextField(
            hintText: AppStrings.password.tr(),
            borderRadius: 15,
            hintTextColor: ColorsManager.containerTitleColor,
          ),
          20.verticalSpace,
          Container(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              overlayColor: WidgetStateProperty.all(Colors.amber),
              splashColor: Colors.amber,
              child: Text(
                AppStrings.forgotPassword.tr(),
                style:
                    TextStyles.font16GreenExtraBold.copyWith(fontSize: 15.sp),
              ),
            ),
          ),
          10.verticalSpace,
          CustomButton.withoutIcon(
            text: AppStrings.login.tr(),
            onPressed: () {},
            backgroundColor: ColorsManager.containerTitleColor,
            fontSize: 25,
          )
        ],
      ),
    );
  }
}
