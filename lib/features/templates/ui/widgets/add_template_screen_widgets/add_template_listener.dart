import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/overlay_loading_state.dart';
import '../../../logic/add_template_cubit/add_template_cubit.dart';

class AddTemplateListener extends StatelessWidget {
  const AddTemplateListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTemplateCubit, AddTemplateState>(
      listener: (context, state) {
        state.whenOrNull(

          addTemplateLoadingState: () => startLoading(context),
          addTemplateSuccessState: (addTemplateResponse) {
            stopLoading(context);
            context.pushReplacementNamed(Routes.templatesScreen);
          },
          updateTemplateLoadingState: () => startLoading(context),
          updateTemplateSuccessState: (baseResponse) {
            stopLoading(context);
            context.pushReplacementNamed(Routes.templatesScreen);
          },
          error: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);

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
