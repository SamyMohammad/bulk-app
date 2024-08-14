import 'package:bulk_app/features/manage_audiances/presentation/cubits/manage_audience_cubit/manage_audiances_cubit.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/manage_audiances_widgets/audiance_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bulk_app/core/widgets/overlay_loading_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudiancesListView extends StatelessWidget {
  const AudiancesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageAudiancesCubit, ManageAudiancesState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (audiences) {
            return ListView.separated(
              itemCount: audiences.length,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemBuilder: (context, index) {
                final audience = audiences[index];
                return BlocProvider.value(
                  value: context.read<ManageAudiancesCubit>(),
                  child: AudianceItem(audiences: audience),
                );
              },
            );
          },
          initial: () {
            BlocProvider.of<ManageAudiancesCubit>(context).init();
            return loadingSpinKit();
          },
          loading: () => loadingSpinKit(),
          error: (message) => Center(child: Text(message)),
          orElse: () => const Center(child: Text('No data available')),
        );
      },
    );
  }
}
