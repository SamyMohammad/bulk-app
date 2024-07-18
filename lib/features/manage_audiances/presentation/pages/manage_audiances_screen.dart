import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/manage_audiances_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ManageAudiancesScreen extends StatelessWidget {
  const ManageAudiancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          title: AppStrings.manageAudiences.tr(),
        ),
        body: const ManageAudiancesBody());
  }
}
