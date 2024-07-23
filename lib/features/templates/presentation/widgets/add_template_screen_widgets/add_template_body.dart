import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/features/templates/presentation/widgets/add_template_screen_widgets/add_files_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_text_field.dart';
import 'message_container_widget.dart';

class AddTemplateBody extends StatelessWidget {
  const AddTemplateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppTextField(
              // hintText: 'Template Name',
              label: 'Template Name',
              backgroundColor: ColorsManager.darkBackGround,
            ),
            20.verticalSpace,
            const MessageContainerWidget(),
            20.verticalSpace,
            const AddFilesContainer()
          ],
        ),
      ),
    );
  }
}
