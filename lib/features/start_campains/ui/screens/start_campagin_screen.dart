import 'package:bulk_app/core/widgets/custom_app_bar.dart';
import 'package:bulk_app/features/start_campains/ui/widgets/add_files_container.dart';
import 'package:bulk_app/features/start_campains/ui/widgets/manage_contacts_and_templates_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/message_container.dart';

class StartCampaginScreen extends StatelessWidget {
  const StartCampaginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(title: 'StartCampagin'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ManageContactsAndTemplatesButtonsRow(),
              15.verticalSpace,
              const MessageContainer(),
              15.verticalSpace,
              const AddFilesContainer()
            ],
          ),
        ),
      ),
    );
  }
}
