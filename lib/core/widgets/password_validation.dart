import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/features/whats_bots/logic/cubit/whatsbots_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(AppStrings.atLeastOneLowercase.tr(), hasLowerCase),
        verticalSpace(2),
        buildValidationRow(AppStrings.atLeastOneUppercase.tr(), hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            AppStrings.atLeastOneSpecialCharacter.tr(), hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow(AppStrings.atLeastOneNumber.tr(), hasNumber),
        verticalSpace(2),
        buildValidationRow(
            AppStrings.atLeastEightCharacters.tr(), hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: hasValidated
              ? Colors.green
              : ColorsManager.saerchTextFieldHintColor,
        ),
        horizontalSpace(6),
        Row(
          children: [
            Text(
              text,
              style: TextStyles.font15whiteMedium.copyWith(
                decoration: hasValidated ? TextDecoration.lineThrough : null,
                // decorationStyle: TextDecorationStyle.wavy,
                decorationColor: Colors.green,
                decorationThickness: 1,
                color: !hasValidated
                    ? ColorsManager.saerchTextFieldHintColor
                    : ColorsManager.containerTitleColor,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            if (hasValidated)
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                  size: 18,
                ),
              )
          ],
        )
      ],
    );
  }
}
