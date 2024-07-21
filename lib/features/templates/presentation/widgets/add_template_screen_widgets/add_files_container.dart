import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class AddFilesContainer extends StatelessWidget {
  const AddFilesContainer({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              // textAlign: TextAlign.left,
              'Add Files',
              style: TextStyles.font24limeExtraBold,
            ),
          ),
          6.verticalSpace,
          Row(
            // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              Expanded(
                child: CustomButton.withIcon(
                    text: 'Media',
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    fontSize: 17.sp,
                    onPressed: () {},
                    backgroundColor: ColorsManager.teal400,
                    iconPath: 'assets/icons/video_camera_back.svg'),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomButton.withIcon(
                    text: 'Files',
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    fontSize: 17.sp,
                    backgroundColor: ColorsManager.teal400,
                    onPressed: () {},
                    iconPath: 'assets/icons/attach_file.svg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
