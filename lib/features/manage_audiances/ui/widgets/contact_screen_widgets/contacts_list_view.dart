import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => 20.sizedBoxHeight,
        itemBuilder: (context, index) {
          return const ContactItem();
        });
  }
}
