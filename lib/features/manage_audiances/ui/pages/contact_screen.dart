import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/contact_screen_body.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/add_contacts_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            const AddContactsButton(path: 'assets/icons/person_add.svg'),
        appBar: MyCustomAppBar(
          title: AppStrings.manageAudiences.tr(),     
        ),
        body: const ContactScreenBody());
  }
}
