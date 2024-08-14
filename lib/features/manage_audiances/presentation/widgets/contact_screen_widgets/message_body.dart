import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/manage_audiances/presentation/cubits/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/presentation/widgets/contact_screen_widgets/show_add_contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({super.key, required this.cubit});
  final ContactScreenCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.saerchTextFieldBackGroundColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 0, 5.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Allow the Col
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Message',
                style: TextStyles.font16GreenExtraBold,
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  showAddContactForm(context, cubit);
                },
                child: Text(
                  "Add Contact",
                  style:
                      TextStyles.font16GreenExtraBold.copyWith(fontSize: 16.sp),
                ),
              ),
              SizedBox(height: 6.h),
              GestureDetector(
                onTap: () {
                  // Handle "Add from CSV File" action here
                },
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
