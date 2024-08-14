import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            //Todo: Avatar needs to be Changed When getting images of contacts
            backgroundColor: Colors.white,
            radius: 30.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Name',
                style: TextStyles.font15whiteMedium.copyWith(fontSize: 18.sp),
              ),
              1.sizedBoxHeight,
              Text(
                '###number###',
                style: TextStyle(
                    color: ColorsManager.saerchTextFieldHintColor,
                    fontSize: 12.sp),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            height: double.maxFinite,
            width: 1.w,
            color: ColorsManager.saerchTextFieldHintColor,
          ),
          Icon(
            Icons.check_box_outline_blank,
            color: ColorsManager.limeColor,
            size: 25.h,
          ),
        ],
      ),
    );
  }
}
