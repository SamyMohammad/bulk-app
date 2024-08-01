import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
import 'package:bulk_app/features/templates/ui/widgets/add_template_screen_widgets/add_files_container.dart';
import 'package:bulk_app/features/templates/ui/widgets/add_template_screen_widgets/add_template_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/overlay_loading_state.dart';
import 'message_container_widget.dart';

class AddTemplateBody extends StatelessWidget {
  const AddTemplateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTemplateCubit, AddTemplateState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const BuildAddTemplateBodyWidget(),
          loading: () => loadingSpinKit(),
          getTemplateByIdSuccess: (data) {
            stopLoading(context);
            return const BuildAddTemplateBodyWidget();
          },
          error: (error) {
            return Text(error[0].toString());
          },
        );
      },
    );
  }
}

class BuildAddTemplateBodyWidget extends StatelessWidget {
  const BuildAddTemplateBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            AppTextField(
              label: 'Template Name',
              backgroundColor: ColorsManager.darkBackGround,
              controller:
                  context.read<AddTemplateCubit>().templateNameController,
            ),
            20.verticalSpace,
            const MessageContainerWidget(),
            20.verticalSpace,
            const AddFilesContainer(),
            const AddTemplateListener()
          ],
        ),
      ),
    );
  }
}
