import 'package:bulk_app/features/manage_audiances/presentation/cubits/manage_audience_cubit/manage_audience_cubit.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/manage_audiances_widgets/audiance_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bulk_app/core/widgets/overlay_loading_state.dart';

class AudiancesListView extends StatelessWidget {
  const AudiancesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageAudiancesCubit, ManageAudiancesState>(
      builder: (context, state) {
        if (state is AudienceLoaded) {
          return ListView.separated(
            itemCount: state.audiences.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final audience = state.audiences[index];
              return AudianceItem(audiences: audience);
            },
          );
        } else if (state is AudienceInitial) {
          BlocProvider.of<ManageAudiancesCubit>(context).init();
          return loadingSpinKit();
        } else if (state is AudienceLoading) {
          return loadingSpinKit();
        } else if (state is AudienceError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
