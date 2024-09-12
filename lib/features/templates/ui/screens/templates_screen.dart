import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/templates_screen_widgets/templates_screen_body.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.pushNamed(Routes.addTemplateScreen),
            backgroundColor: ColorsManager.containerTitleColor,
            child: const VectorGraphic(
              loader:
                  AssetBytesLoader('assets/icons/comment_bank_floating.svg'),
            )),
        appBar: MyCustomAppBar(
          title: AppStrings.manageAudiences.tr(),
        ),
        body: const TemplatesBody());
  }
}
