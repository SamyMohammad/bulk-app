import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/manage_audiances/ui/pages/manage_audiances_screen.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/contacts_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_strings.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/app_text_field.dart';

class ContactScreenBody extends StatelessWidget {
  final Arguments args;
  const ContactScreenBody({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppTextField(
            hintText: 'Audience Name',
            prefixIcon: Icon(
              Icons.person,
              size: 25.sp,
              color: ColorsManager.saerchTextFieldHintColor,
            ),
          ),
          AppTextField(
            hintText: AppStrings.searchContacts.tr(),
            prefixIcon: Icon(
              Icons.search,
              size: 25.sp,
              color: ColorsManager.saerchTextFieldHintColor,
            ),
          ),
          20.sizedBoxHeight,
          const Expanded(child: ContactsListView()),
        ],
      ),
    );
  }
}
