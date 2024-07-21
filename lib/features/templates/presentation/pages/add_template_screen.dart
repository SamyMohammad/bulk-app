import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/add_template_screen_widgets/add_template_body.dart';

class AddTemplatesScreen extends StatelessWidget {
  const AddTemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          title: AppStrings.manageAudiences.tr(),
        ),
        body: const AddTemplateBody());
  }
}
