import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/core/widgets/app_text_field.dart';
import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:bulk_app/core/widgets/password_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../logic/login_cubit/login_cubit.dart';

class BuildLoginContainer extends StatefulWidget {
  const BuildLoginContainer({
    super.key,
  });

  @override
  State<BuildLoginContainer> createState() => _BuildLoginContainerState();
}

class _BuildLoginContainerState extends State<BuildLoginContainer> {
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
    passwordController = context.read<LoginCubit>().passwordController;
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
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
          color: ColorsManager.darkAppBarBackGround,
          borderRadius: const BorderRadius.all(
            Radius.circular(21),
          ),
          border: Border.all(color: ColorsManager.saerchTextFieldHintColor)),
      child: Form(
        key: context.read<LoginCubit>().formKey,
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
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return AppStrings.invalidEmail.tr();
                }
                return null;
              },
              controller: context.read<LoginCubit>().emailController,
            ),
            15.verticalSpace,
            AppTextField(
              hintText: AppStrings.password.tr(),
              borderRadius: 15,
              hintTextColor: ColorsManager.containerTitleColor,
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                  color: ColorsManager.saerchTextFieldHintColor,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.invalidPassword.tr();
                }
                return null;
              },
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
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                overlayColor: WidgetStateProperty.all(Colors.amber),
                splashColor: Colors.amber,
                child: Text(
                  AppStrings.forgotPassword.tr(),
                  style: TextStyles.font16GreenExtraBold.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorsManager.containerTitleColor.withOpacity(.8)),
                ),
              ),
            ),
            10.verticalSpace,
            CustomButton.withoutIcon(
              text: AppStrings.login.tr(),
              onPressed: () => validateThenDoLogin(context),
              backgroundColor: ColorsManager.containerTitleColor,
              fontSize: 25,
            ),
            18.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.dontHaveAccount.tr(),
                    style: TextStyle(
                        color: ColorsManager.containerTitleColor,
                        fontSize: 15.sp)),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.registerScreen),
                  child: Text(
                    AppStrings.signUp.tr(),
                    style: TextStyle(
                      color: ColorsManager.containerTitleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate() &&
        AppRegex.isPasswordValid(passwordController.text)) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
