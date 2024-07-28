import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/features/support/widgets/faq_body.dart';
import 'package:bulk_app/features/support/widgets/help_center_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        title: AppStrings.manageAudiences.tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              FAQBody(),
              SizedBox(height: 10.h),
              HelpCenterBody(),
            ],
          ),
        ),
      ),
    );
  }
}
