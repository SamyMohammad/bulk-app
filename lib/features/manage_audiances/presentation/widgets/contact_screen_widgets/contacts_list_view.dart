import 'package:bulk_app/core/widgets/overlay_loading_state.dart';
import 'package:bulk_app/features/manage_audiances/presentation/cubits/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/contact_screen_widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactScreenCubit, ContactScreenState>(
      builder: (context, state) {
        if (state is ContactsLoaded) {
          return ListView.separated(
            itemCount: state.contacts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              return ContactItem(contact: state.contacts[index]);
            },
          );
        } else if (state is ContactsLoading) {
          return loadingSpinKit();
        } else if (state is ContactsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No data availableee'));
        }
      },
    );
  }
}
