import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/audiance_item.dart';
import 'package:bulk_app/features/templates/presentation/widgets/audiance_item.dart';
import 'package:flutter/material.dart';

class TemplatesListView extends StatelessWidget {
  const TemplatesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => 20.sizedBoxHeight,
        itemBuilder: (context, index) {
          return const TemplateItem();
        });
  }
}
