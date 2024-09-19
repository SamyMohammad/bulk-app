import 'dart:io';

import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:bulk_app/features/start_campains/logic/start_campagin_cubit.dart';
import 'package:bulk_app/features/templates/ui/widgets/add_template_screen_widgets/build_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class AddFilesContainer extends StatelessWidget {
  const AddFilesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StartCampaginCubit>();
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
                    onPressed: () => context
                        .read<StartCampaginCubit>()
                        .pickMultipleMedia(context),
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
          ),
          6.verticalSpace,
          BlocBuilder<StartCampaginCubit, StartCampaginState>(
              builder: (context, state) {
            File? fileFromDevice;
            if (cubit.pickedFilefromDevice != null) {
              fileFromDevice = File(cubit.pickedFilefromDevice!.path);
            }
            return state.maybeWhen(
                orElse: () => BuildImageWidget(
                      pickedFileFromApi: null,
                      pickedFileFromDevice: fileFromDevice,
                    ),
                pickedMultiMediaAndFiles: (pickedFile) {
                  if (pickedFile != null) {
                    return BuildImageWidget(
                      pickedFileFromApi: null,
                      pickedFileFromDevice: fileFromDevice,
                    );
                  }
                  return const SizedBox.shrink();
                });
          }),
        ],
      ),
    );
  }
}
