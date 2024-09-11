import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/widgets/app_floating_action_button.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/manage_audiances_widgets/manage_audiances_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ManageAudiancesScreen extends StatelessWidget {
  const ManageAudiancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AppFloatingActionButton(
          onPressed: () => _flotingOnClick(context),
          path: 'assets/icons/comment_bank_floating.svg',
        ),
        appBar: MyCustomAppBar(
          title: AppStrings.manageAudiences.tr(),
        ),
        body: const ManageAudiancesBody());
  }

  _flotingOnClick(BuildContext context) {
    context.pushNamed(Routes.conatctScreen, arguments: Arguments(isAddNewAudience: true, audienceId: '',));
  }
}
 

 class Arguments{

  bool? isAddNewAudience;
  String? audienceId;
  String? audienceName;
  List<Contact>? selctedContacts;
  Arguments({required this.isAddNewAudience, required this.audienceId,  this.audienceName, this.selctedContacts});
 }