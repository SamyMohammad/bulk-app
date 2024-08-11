import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/templates/logic/templates_cubit/templates_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_strings.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/app_text_field.dart';
import 'templates_list_view.dart';

class TemplatesBody extends StatelessWidget {
  const TemplatesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          AppTextField(
            hintText: AppStrings.searchTemplates.tr(),
            onChanged: (query) {
              context.read<TemplatesCubit>().getFilteredTemplatesListFrom(
                    query: query,
                  );
            },
            prefixIcon: Icon(
              Icons.search,
              size: 25.sp,
              color: ColorsManager.saerchTextFieldHintColor,
            ),
          ),
          20.sizedBoxHeight,
          const Expanded(child: TemplatesListView()),
        ],
      ),
    );
  }
}
