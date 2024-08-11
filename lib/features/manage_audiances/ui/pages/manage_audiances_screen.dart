import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/manage_audiances_widgets/manage_audiances_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ManageAudiancesScreen extends StatelessWidget {
  const ManageAudiancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        title: AppStrings.manageAudiences.tr(),
      ),
      body: const ManageAudiancesBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(Routes.conatctScreen),
        backgroundColor: ColorsManager.containerTitleColor,
        child: SvgPicture.asset('assets/icons/comment_bank_floating.svg'),
      ),
    );
  }
}
