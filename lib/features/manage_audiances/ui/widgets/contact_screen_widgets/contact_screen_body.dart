import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/pages/manage_audiances_screen.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/contacts_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_strings.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/overlay_loading_state.dart';

class ContactScreenBody extends StatelessWidget {
  final Arguments args;
  final String? restorationId;
  const ContactScreenBody({super.key, required this.args, this.restorationId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppTextField(
            hintText: 'Audience Name',
            controller:
                context.read<ContactScreenCubit>().audienceNameController.value,
            restorationId: restorationId,
            prefixIcon: Icon(
              Icons.person,
              size: 25.sp,
              color: ColorsManager.saerchTextFieldHintColor,
            ),
          ),
          AppTextField(
            hintText: AppStrings.searchContacts.tr(),
            prefixIcon: Icon(
              Icons.search,
              size: 25.sp,
              color: ColorsManager.saerchTextFieldHintColor,
            ),
          ),
          20.sizedBoxHeight,
          const Expanded(child: ContactsListView()),
          const ContactScreenListener()
        ],
      ),
    );
  }
}

class ContactScreenListener extends StatelessWidget {
  const ContactScreenListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactScreenCubit, ContactScreenState>(
      // listenWhen: (previous, current) =>
      //     current is AddContactsToServerLoadingState ||
      //     current is AddContactsToServerSuccessState ||
      //     current is AddContactsToServerErrorsState,
      listener: (context, state) {
        state.whenOrNull(
          addContactsToServerLoadingState: () => startLoading(context),
          addContactsToServerSuccessState: (response) {
            stopLoading(context);
            context.pushReplacementNamed(
              Routes.manageAudiances,
            );
          },
          addContactsToServerErrorsState: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
          //  updateContactsInServer
          updateContactsInServerLoadingState: () => startLoading(context),
          updateContactsInServerSuccessState: () {
            stopLoading(context);
            context.pushReplacementNamed(
              Routes.manageAudiances,
            );
          },
          updateContactsInServerErrorState: (apiErrorModel) {
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
          apiErrorModel.error!.message!,
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
