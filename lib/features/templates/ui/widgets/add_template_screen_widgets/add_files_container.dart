import 'dart:io';

import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class AddFilesContainer extends StatelessWidget {
  const AddFilesContainer({super.key});

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
                    onPressed: () =>
                        context.read<AddTemplateCubit>().pickMultipleMedia(context),
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
          BlocBuilder<AddTemplateCubit, AddTemplateState>(
            builder: (context, state) {
              return state.maybeWhen(
                pickedMultiMediaAndFiles: (pickedMedia) {
                  if (pickedMedia == null) {
                    return const SizedBox.shrink();
                  }else{
                    File file = File(pickedMedia.path);
                    return SizedBox(
                    height: context.height * 0.2,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            file ,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: -12.h,
                          right: -12.w,
                          child: IconButton(
                            onPressed: () => cubit.emitRemoveImage(),
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  }
                  
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          )
        ],
      ),
    );
  }
}
