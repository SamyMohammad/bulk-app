import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/widgets/app_floating_action_button.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/pages/manage_audiances_screen.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/contact_screen_body.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/message_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({
    super.key,
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with RestorationMixin {
  Arguments? args;
  late ContactScreenCubit cubit;
  // List<Contact>? selctedContacts;
  @override
  String get restorationId => 'contact_screen';
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cubit.audienceNameController, 'name_controller');
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<ContactScreenCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.audienceNameController.value.text = args?.audienceName ?? '';
      if (args?.isAddNewAudience == false) {
        cubit.emitGetAudienceByIdStates(args?.audienceId ?? '');
      }
    });
    cubit.audienceNameController.addListener(() {
      cubit.changeValidButton();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as Arguments?;

    // selctedContacts =
    //     ModalRoute.of(context)!.settings.arguments as List<Contact>?;
    // print(selctedContacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AppFloatingActionButton(
          path: 'assets/icons/person_add.svg',
          onPressed: () => _floatingOnClick(context),
        ),
        appBar: MyCustomAppBar(
          title: AppStrings.manageAudiences.tr(),
          actions: [
            BlocBuilder<ContactScreenCubit, ContactScreenState>(
              builder: (context, state) {
                final cubit = context.read<ContactScreenCubit>();
                return buildValidButton(
                  isValid: cubit.isValid,
                  cubit: cubit,
                );
              },
            )
          ],
        ),
        body: ContactScreenBody(args: args!, restorationId: restorationId));
  }

  IconButton buildValidButton({
    required bool isValid,
    required ContactScreenCubit cubit,
  }) {
    return IconButton(
        onPressed: isValid
            ? () => args?.isAddNewAudience == true
                ? cubit.emitAddContactsToServerStates()
                : cubit.emitUpdateContactsToServerStates()
            : null,
        icon: Icon(
          Icons.check_circle_rounded,
          // color: color,
          color: cubit.isValid ? Colors.green : Colors.grey,
          size: 40.r,
        ));
  }

  void _floatingOnClick(BuildContext context) {
    // Access the cubit instance
    final cubit = context.read<ContactScreenCubit>();
    // Example action: Show a dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MessageBody(cubit: cubit); // Pass cubit if needed
      },
    );
  }
}
