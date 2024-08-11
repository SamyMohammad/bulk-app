import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:bulk_app/features/auth/logic/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/overlay_loading_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      // listenWhen: (previous, current) =>
          // current is RegisterErrorState || current is RegisterSuccessState || current is RegisterLoadingState,
      listener: (context, state) {
        state.whenOrNull(
          registerLoadingState: () => startLoading(context),
          registerSuccussState: (loginResponse) {
            stopLoading(context);
            context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate: (context) => false);
          },
          registerErrorState: (apiErrorModel) {
            setupErrorState(context,apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          apiErrorModel.getAllErrorMessages(),
          style: TextStyles.font15whiteMedium.copyWith(color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font24BlackBold.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
