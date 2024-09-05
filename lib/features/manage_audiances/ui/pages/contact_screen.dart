import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/widgets/app_floating_action_button.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/pages/manage_audiances_screen.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/contact_screen_body.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/message_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({
    super.key,
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Arguments? args;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // Access context here
      if (mounted) {
        context.read<ContactScreenCubit>().getAudienceById(args!.audienceId);
      }
      // Do something with inheritedWidget
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as Arguments?;

    // Use context here to access inherited widgets
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
                return IconButton(
                    onPressed: () => context
                        .read<ContactScreenCubit>()
                        .emitAddContactsToServerStates(),
                    icon: Icon(
                      Icons.check_circle_rounded,
                      color:
                          // cubit.isValid ? Colors.green :
                          Colors.grey,
                      size: 40.r,
                    ));
              },
            )
          ],
        ),
        body: ContactScreenBody(
          args: args!,
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
