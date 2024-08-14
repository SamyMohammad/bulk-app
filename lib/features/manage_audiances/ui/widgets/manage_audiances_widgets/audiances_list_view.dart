import 'package:bulk_app/core/widgets/empty_state.dart';
import 'package:bulk_app/core/widgets/overlay_loading_state.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_audience_cubit/manage_audience_cubit.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_audience_cubit/manage_audience_state.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/manage_audiances_widgets/audiance_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudiancesListView extends StatelessWidget {
  const AudiancesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageAudiancesCubit, ManageAudiancesState>(
      builder: (context, state) {
        return state.maybeWhen(
          audienceLoadingState: () => loadingSpinKit(),
          audienceEmptyState: () => const EmptyState(),
          audienceErrorState: (error) =>
              Center(child: Text(error.getAllErrorMessages())),
          audienceSuccessState: (audiences) {
            return ListView.separated(
              itemCount: audiences?.length ?? 0,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final audience = audiences![index];
                return AudianceItem(audiences: audience);
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
