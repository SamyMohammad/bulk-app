import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/contact_screen_widgets/contacts_list_view.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/contact_screen_widgets/select_all_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_strings.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/app_text_field.dart';

class ContactScreenBody extends StatelessWidget {
  const ContactScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  hintText: AppStrings.searchContacts.tr(),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25.sp,
                    color: ColorsManager.saerchTextFieldHintColor,
                  ),
                ),
              ),
              12.sizedWidth,
              const SelectAllButton()
            ],
          ),
          20.sizedBoxHeight,
          const Expanded(child: ContactsListView()),
        ],
      ),
    );
  }
}
