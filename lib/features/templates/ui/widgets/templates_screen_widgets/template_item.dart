import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/templates/data/models/get_all_templates_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemplateItem extends StatelessWidget {
  final Templates template;
  const TemplateItem({super.key, required this.template});

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                template.name ?? '',
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
          const Spacer(),
          Icon(
            Icons.delete_forever,
            color: Colors.red,
            size: 37.r,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            height: double.maxFinite,
            width: 1.w,
            color: ColorsManager.saerchTextFieldHintColor,
          ),
          5.sizedWidth,
          Container(
            height: 26.h,
            width: 26.w,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.containerTitleColor),
            child: Icon(
              Icons.edit_rounded,
              // color: Colors.red,
              size: 20.r,
            ),
          ),
        ],
      ),
    );
  }
}
