import 'package:bulk_app/core/widgets/overlay_loading_state.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactScreenCubit, ContactScreenState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (contacts) {
            return ListView.separated(
              itemCount: contacts.length,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemBuilder: (context, index) {
                return ContactItem(contact: contacts[index]);
              },
            );
          },
          loading: () => loadingSpinKit(),
          error: (message) => Center(child: Text(message.getAllErrorMessages())),
          orElse: () => const Center(child: Text('No data available')),
        );
      },
    );
  }
}
