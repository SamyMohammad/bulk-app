import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/core/widgets/app_text_button.dart';
import 'package:bulk_app/core/widgets/app_text_field.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showAddContactForm(BuildContext context, ContactScreenCubit cubit) {
  // Create text controllers
  final contactNameController = TextEditingController();
  final contactNumberController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: cubit,
        child: Dialog(
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
              padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 20.sp, 10.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add to Audience',
                    style: TextStyles.font16GreenExtraBold,
                  ),
                  SizedBox(height: 10.h),
                  AppTextField(
                    hintText: "Contact Name",
                    controller:
                        contactNameController, // Pass the controller here
                  ),
                  SizedBox(height: 10.h),
                  AppTextField(
                    hintText: "Contact Number",
                    controller:
                        contactNumberController, // Pass the controller here
                  ),
                  SizedBox(height: 10.h),
                  AppTextButton(
                    buttonText: "Add to List",
                    onPressed: () {
                      // Access the text from the controllers
                      final contactName = contactNameController.text;
                      final contactNumber = contactNumberController.text;

                      // Use the text values as needed, e.g., call a method in the cubit
                      cubit.emitAddContactStates(
                          contactName: contactName,
                          contactNumber: contactNumber);

                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    textStyle:
                        TextStyles.font15whiteMedium.copyWith(fontSize: 20.sp),
                    backgroundColor: ColorsManager.limeColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
