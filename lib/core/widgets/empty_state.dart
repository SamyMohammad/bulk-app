import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/jsons/empty.json'),
        Text(
          'No data found',
          style: TextStyles.font26whiteRegular
              .copyWith(color: ColorsManager.saerchTextFieldColor),
        )
      ],
    );
  }
}
