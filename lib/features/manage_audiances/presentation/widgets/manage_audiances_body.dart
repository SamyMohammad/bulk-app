import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/audiances_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_strings.dart';
import '../../../../core/widgets/app_search_field.dart';

class ManageAudiancesBody extends StatelessWidget {
  const ManageAudiancesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          AppSearchField(
            hintText: AppStrings.searchAudiences.tr(),
          ),
          20.sizedBoxHeight,
          const Expanded(child: AudiancesListView()),
        ],
      ),
    );
  }
}
