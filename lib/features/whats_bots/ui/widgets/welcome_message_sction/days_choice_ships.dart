import 'package:bulk_app/features/whats_bots/logic/cubit/whatsbots_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';

class DaysChoiceChips extends StatefulWidget {
  const DaysChoiceChips({super.key});

  @override
  DaysChoiceChipsState createState() => DaysChoiceChipsState();
}

class DaysChoiceChipsState extends State<DaysChoiceChips> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WhatsbotsCubit>();

    return Wrap(
      spacing: 5.0,
      alignment: WrapAlignment.start,
      children: cubit.options.map((option) {
        final isSelected = cubit.selectedChoices.contains(option);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: ChoiceChip(
            selectedColor: ColorsManager.containerTitleColor,
            label: Text(
              option,
              style: TextStyle(
                  color: isSelected
                      ? ColorsManager.darkAppBarBackGround
                      : ColorsManager.containerTitleColor),
            ),
            selected: isSelected,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: ColorsManager.containerTitleColor,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            color: WidgetStatePropertyAll(isSelected
                ? ColorsManager.containerTitleColor
                : ColorsManager.darkAppBarBackGround),
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  cubit.selectedChoices.add(option);
                } else {
                  cubit.selectedChoices.remove(option);
                }
              });
            },
          ),
        );
      }).toList(),
    );
  }
}
