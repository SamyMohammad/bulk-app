import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/pages/manage_audiances_screen.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/show_add_contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBody extends StatelessWidget {
  final Arguments args;
  const MessageBody({super.key, required this.cubit,required this.args});
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
