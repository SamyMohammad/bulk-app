import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/core/widgets/empty_state.dart';
import 'package:bulk_app/features/templates/logic/templates_cubit/templates_cubit.dart';
import 'package:bulk_app/features/templates/ui/widgets/templates_screen_widgets/template_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/overlay_loading_state.dart';

class TemplatesListView extends StatelessWidget {
  const TemplatesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemplatesCubit, TemplatesState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          getAllTemplatesLoadingState: () => loadingSpinKit(),
          getAllTemplatesSuccessState: (data) {
            final templates = data.templates ?? [];
            return ListView.separated(
                itemCount: templates.length,
                separatorBuilder: (context, index) => 20.sizedBoxHeight,
                itemBuilder: (context, index) {
                  return  TemplateItem(template: templates[index],);
                });
          },
          getAllTemplatesErrorState: (error) => Text(
            'There is an error',
            style: TextStyles.font16GreenExtraBold.copyWith(fontSize: 18.sp),
          ),
          getAllTemplatesEmptyState: (data) => const EmptyState(),
        );
      },
    );
  }
}
