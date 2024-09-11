import 'package:bulk_app/features/whats_bots/logic/cubit/whatsbots_cubit.dart';
import 'package:bulk_app/features/whats_bots/ui/widgets/custom_container.dart';
import 'package:bulk_app/features/whats_bots/ui/widgets/custom_expansion_tile.dart';
import 'package:bulk_app/features/whats_bots/ui/widgets/welcome_message_sction/days_choice_ships.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_field.dart';

class WelcomeMesageExpansionTile extends StatefulWidget {
  const WelcomeMesageExpansionTile({super.key});

  @override
  State<WelcomeMesageExpansionTile> createState() =>
      _WelcomeMesageExpansionTileState();
}

class _WelcomeMesageExpansionTileState
    extends State<WelcomeMesageExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        widget: CustomExpansionTile(
      title: 'Welcome Message',
      controller: context.read<WhatsbotsCubit>().welcomeMessageController,
      children: <Widget>[
        Text(
          'Message Subject',
          style: TextStyles.font15limeExtraBold,
        ),
        5.verticalSpace,
        AppTextField(
          hintText: 'Subject',
          maxLine: 5,
          borderRadius: 18.r,
          // controller:
          //     context.read<AddTemplateCubit>().messageController,
        ),
        5.verticalSpace,
        Text(
          'Delay',
          style: TextStyles.font15limeExtraBold,
        ),
        5.verticalSpace,
        AppTextField(
          hintText: 'Subject',
          maxLine: 1,
          borderRadius: 18.r,
          // controller:
          //     context.read<AddTemplateCubit>().messageController,
        ),
        5.verticalSpace,
        Text(
          'Selected Days',
          style: TextStyles.font24limeExtraBold,
        ),
        const DaysChoiceChips()
      ],
    ));
  }
}
