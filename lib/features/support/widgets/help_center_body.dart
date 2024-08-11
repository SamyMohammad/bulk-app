import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/support/support_texts.dart';
import 'package:bulk_app/features/support/widgets/tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: ColorsManager.saerchTextFieldHintColor,
            ),
            borderRadius: BorderRadius.circular(17.r),
            color: ColorsManager.darkAppBarBackGround),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Help Center',
              style: TextStyles.font24limeExtraBold,
            ),
            SizedBox(height: 10.h),
            TileItem(
              title: title5,
              document: document5,
            ),
            TileItem(
              title: title6,
              document: document6,
            ),
          ],
        ));
  }
}
