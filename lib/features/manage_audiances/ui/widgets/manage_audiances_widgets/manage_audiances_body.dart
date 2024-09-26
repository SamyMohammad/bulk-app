import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/manage_audiances_widgets/audiances_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../../core/resources/app_strings.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/app_text_field.dart';

class ManageAudiancesBody extends StatelessWidget {
  const ManageAudiancesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            AppTextField(
              hintText: AppStrings.searchAudiences.tr(),
              prefixIcon: Icon(
                Icons.search,
                size: 25.sp,
                color: ColorsManager.saerchTextFieldHintColor,
              ),
            ),
            20.sizedBoxHeight,
            const Expanded(child: AudiancesListView()),
          ],
        ),
      );
    });
  }
}
