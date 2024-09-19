import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../core/theming/styles.dart';

class ManageContactsAndTemplatesButtonsRow extends StatelessWidget {
  const ManageContactsAndTemplatesButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle Manage Contacts button press
              },
              icon: const VectorGraphic(
                  loader: AssetBytesLoader(
                    "assets/icons/campaign.svg",
                  ),
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              label: Text(
                "Manage Contacts",
                style: TextStyles.font17whiteMedium,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 7.w),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle Messages Templates button press
              },
              icon: const VectorGraphic(
                  loader: AssetBytesLoader(
                    "assets/icons/comment_bank_floating.svg",
                  ),
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              label: Text(
                "Messages Templates",
                style: TextStyles.font17whiteMedium,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                backgroundColor: Colors.green,
                padding:
                    EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
