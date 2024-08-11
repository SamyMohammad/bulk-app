import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: ColorsManager.saerchTextFieldBackGroundColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 0, 5.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Message',
                style: TextStyles.font16GreenExtraBold,
              ),
              SizedBox(height: 2.h),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Add Contact",
                  style:
                      TextStyles.font16GreenExtraBold.copyWith(fontSize: 16.sp),
                ),
              ),
              SizedBox(height: 6.h),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Add from CSV File",
                  style:
                      TextStyles.font16GreenExtraBold.copyWith(fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
