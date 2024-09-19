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
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
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
