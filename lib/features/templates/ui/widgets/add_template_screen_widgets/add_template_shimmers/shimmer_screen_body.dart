import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/templates/ui/widgets/add_template_screen_widgets/add_template_shimmers/add_file_container_shimmer.dart';
import 'package:bulk_app/features/templates/ui/widgets/add_template_screen_widgets/add_template_shimmers/app_text_field_shimmer.dart';
import 'package:bulk_app/features/templates/ui/widgets/add_template_screen_widgets/add_template_shimmers/message_container_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerScreenBody extends StatelessWidget {
  const ShimmerScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 2, child: AppTextFieldShimmer()),
        20.sizedBoxHeight,
        const Expanded(flex: 5, child: AddFileContainerShimmer()),
        20.sizedBoxHeight,
        const Expanded(flex: 3, child: MessageContainerShimmer()),
        20.sizedBoxHeight,
      ],
    );
  }
}
