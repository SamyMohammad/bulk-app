import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_field.dart';

class MessageContainerWidget extends StatelessWidget {
  const MessageContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddTemplateCubit>();
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
            controller: context.read<AddTemplateCubit>().messageController,
          ),
          20.verticalSpace,
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
                  onPressed: () => cubit.addCurrentDateInMessage(),
                  text: 'Date',
                  iconPath: 'assets/icons/calendar_month.svg',
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomButton.withIcon(
                  onPressed: () => cubit.addCurrentTimeInMessage(),
                  text: 'Time',
                  iconPath: 'assets/icons/avg_pace.svg',
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomButton.withIcon(
                  onPressed: () => cubit.addMessageIDInMessage(),
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
