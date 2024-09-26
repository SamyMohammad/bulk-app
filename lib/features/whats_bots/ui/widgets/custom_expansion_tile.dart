import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/features/whats_bots/logic/cubit/whatsbots_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/styles.dart';

class CustomExpansionTile extends StatefulWidget {
  final List<Widget> children;
  final String title;
  bool isEnabled;
  final ExpansionTileController controller;

  CustomExpansionTile(
      {super.key,
      required this.children,
      required this.controller,
      required this.title,
      this.isEnabled = false});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.zero,
        enabled: widget.isEnabled,
        controller: widget.controller,
        showTrailingIcon: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyles.font24limeExtraBold.copyWith(
                color: ColorsManager.saerchTextFieldHintColor, // Custom color
              ),
            ),
            Switch.adaptive(
                value: widget.isEnabled,
                activeColor: ColorsManager.containerTitleColor,
                onChanged: (value) {
                  setState(() {
                    widget.isEnabled = value;
                    if (widget.isEnabled) {
                      widget.controller.expand();
                    } else {
                      widget.controller.collapse();
                    }
                  });
                }),
          ],
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children,
      ),
    );
  }
}
