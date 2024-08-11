import 'package:bulk_app/core/helpers/app_regex.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/core/widgets/app_text_field.dart';
import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:bulk_app/core/widgets/password_validation.dart';
import 'package:bulk_app/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildRegisterContainer extends StatefulWidget {
  const BuildRegisterContainer({
    super.key,
  });

  @override
  State<BuildRegisterContainer> createState() => _BuildRegisterContainerState();
}

class _BuildRegisterContainerState extends State<BuildRegisterContainer> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

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
      child: Form(
        key: context.read<RegisterCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppStrings.signUp.tr(),
              style: TextStyles.font16GreenExtraBold,
            ),
            15.verticalSpace,
            AppTextField(
              hintText: AppStrings.emailID.tr(),
              borderRadius: 15,
              hintTextColor: ColorsManager.containerTitleColor,
              controller: context.read<RegisterCubit>().emailController,
            ),
            15.verticalSpace,
            AppTextField(
              hintText: AppStrings.password.tr(),
              borderRadius: 15,
              hintTextColor: ColorsManager.containerTitleColor,
              controller: passwordController,
            ),
            20.verticalSpace,
            PasswordValidations(
              hasLowerCase: hasLowercase,
              hasUpperCase: hasUppercase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
            20.verticalSpace,
            CustomButton.withoutIcon(
              text: AppStrings.signUp.tr(),
              onPressed: () => validateThenDoRegister(context),
              backgroundColor: ColorsManager.containerTitleColor,
              fontSize: 25,
            ),
          ],
        ),
      ),
    );
  }

  void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate() &&
        AppRegex.isPasswordValid(passwordController.text)) {
      context.read<RegisterCubit>().emitRegisterStates();
    }
  }
}
