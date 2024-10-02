import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/features/start_campains/logic/start_campagin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/overlay_loading_state.dart';

class CreateCampainListener extends StatelessWidget {
  const CreateCampainListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartCampaginCubit, StartCampaginState>(
      listenWhen: (previous, current) =>
          current is CreateCampaignSuccessState ||
          current is CreateCampaignLoadingState ||
          current is CreateCampaignFailureState,
      listener: (context, state) {
        state.whenOrNull(
          createCampaignLoadingState: () => startLoading(context),
          createCampaignSuccessState: () {
            stopLoading(context);
            context.pushNamedAndRemoveUntil(Routes.homeScreen,
                predicate: (context) => false);
          },
          createCampaignFailureState: (apiErrorModel) {
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
