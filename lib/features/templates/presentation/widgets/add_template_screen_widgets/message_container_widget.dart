import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_search_field.dart';

class MessageContainerWidget extends StatelessWidget {
  const MessageContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
            'Message',
            style: TextStyles.font24limeExtraBold,
          ),
          // 5.verticalSpace,
          Text(
            'Subject',
            style: TextStyles.font24limeExtraBold.copyWith(fontSize: 16.sp),
          ),
          5.verticalSpace,

          AppTextField(
            hintText: 'Subject',
            maxLine: 5,
            borderRadius: 18.r,
          ),
          15.verticalSpace,

          Row(
            children: [
              Text('Select Message From  ',
                  style:
                      TextStyles.font24limeExtraBold.copyWith(fontSize: 16.sp)),
              Expanded(
                child: CustomButton.withIcon(
                  iconPath: 'assets/icons/comment_bank.svg',
                  onPressed: () {},
                  fontSize: 13.sp,
                  text: 'Templates',
                  // icon: Icons.tag,
                ),
              )
            ],
          ),
          5.verticalSpace,
          Row(
            children: [
              Text(
                'Smart Tools',
                style: TextStyles.font24limeExtraBold,
              ),
              5.horizontalSpace,
              const Text(
                '(Optional)',
                style: TextStyle(color: Colors.white54),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton.withIcon(
                  onPressed: () {},
                  text: 'Date',
                  iconPath: 'assets/icons/calendar_month.svg',
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomButton.withIcon(
                  onPressed: () {},
                  text: 'Time',
                  iconPath: 'assets/icons/avg_pace.svg',
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomButton.withIcon(
                  onPressed: () {},
                  text: 'Message ID',
                  iconPath: 'assets/icons/tag.svg',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
