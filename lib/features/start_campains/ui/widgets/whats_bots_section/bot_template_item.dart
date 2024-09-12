import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';

class BotTemplateItem extends StatelessWidget {
  const BotTemplateItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      alignment: Alignment.center,
      height: context.height * 0.11,
      decoration: BoxDecoration(
          color: ColorsManager.darkAppBarBackGround,
          borderRadius: const BorderRadius.all(
            Radius.circular(21),
          ),
          border: Border.all(color: ColorsManager.saerchTextFieldHintColor)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'template.name' ?? '',
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyles.font15whiteMedium.copyWith(fontSize: 18.sp),
                ),
                1.sizedBoxHeight,
                Text(
                  '26/07/2023',
                  style: TextStyle(
                      color: ColorsManager.saerchTextFieldHintColor,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 43.r,
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            height: double.maxFinite,
            width: 1.w,
            color: ColorsManager.saerchTextFieldHintColor,
          ),
          5.sizedWidth,
          IconButton(
            onPressed: () {},
            icon: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.containerTitleColor),
              child: Padding(
                padding: EdgeInsets.all(5.r),
                child: Icon(
                  Icons.edit,
                  fill: 1,
                  // color: ColorsManager.containerTitleColor,
                  // color: Colors.red,
                  size: 24.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
