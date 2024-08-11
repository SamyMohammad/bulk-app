import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/manage_audiances_widgets/audiance_item.dart';
import 'package:flutter/material.dart';

class AudiancesListView extends StatelessWidget {
  const AudiancesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => 20.sizedBoxHeight,
        itemBuilder: (context, index) {
          return const AudianceItem();
        });
  }
}
