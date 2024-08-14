import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/features/manage_audiances/presentation/cubits/manage_audience_cubit/manage_audiances_cubit.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/contact_screen_widgets/add_contacts_button.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/contact_screen_widgets/contact_screen_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: const ContactScreenBody(),
    );
  }
}
