import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileItem extends StatelessWidget {
  const TileItem({super.key, required this.title, required this.document});
  final String title;
  final String document;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: ColorsManager.saerchTextFieldHintColor),
            borderRadius: BorderRadius.circular(10.r),
            color: ColorsManager.darkAppBarBackGround),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17.r),
          child: ExpansionTile(
            visualDensity: VisualDensity.compact,
            iconColor: ColorsManager.expansionTileButtonColor,
            collapsedIconColor: ColorsManager.expansionTileButtonColor,
            collapsedBackgroundColor: ColorsManager.darkBackGround,
            backgroundColor: ColorsManager.darkBackGround,
            title: Text(
              title,
              style: TextStyles.font12witeRegular
                  .copyWith(color: ColorsManager.expansionTileButtonColor),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 10, top: 0),
                child: Text(document, style: TextStyles.font12witeRegular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
