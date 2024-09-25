import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/core/widgets/app_text_field.dart';
import 'package:bulk_app/features/start_campains/logic/start_campagin_cubit.dart';
import 'package:bulk_app/features/templates/data/models/get_all_templates_response.dart';
import 'package:bulk_app/features/templates/ui/widgets/templates_screen_widgets/template_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_button.dart';

class MessageContainer extends StatefulWidget {
  const MessageContainer({super.key});

  @override
  State<MessageContainer> createState() => _MessageContainerState();
}

class _MessageContainerState extends State<MessageContainer> {
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
            isEnabled: false,
            maxLine: 5,
            borderRadius: 18.r,
            controller: cubit.messageController,
          ),
          20.verticalSpace,
          Row(
            children: [
              Text('Select Message From  ',
                  style:
                      TextStyles.font24limeExtraBold.copyWith(fontSize: 16.sp)),
              Expanded(
                child: CustomButton.withIcon(
                  iconPath: 'assets/icons/comment_bank.svg',
                  onPressed: () =>
                      buildBottomSheet(context, cubit.templates, cubit),
                  fontSize: 13.sp,
                  text: 'Templates',
                  // icon: Icons.tag,
                ),
              )
            ],
          ),
          15.verticalSpace,
          // Row(
          //   children: [
          //     Text(
          //       'Smart Tools',
          //       style: TextStyles.font24limeExtraBold,
          //     ),
          //     5.horizontalSpace,
          //     const Text(
          //       '(Optional)',
          //       style: TextStyle(color: Colors.white54),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: CustomButton.withIcon(
          //         onPressed: () => cubit.addCurrentDateInMessage(),
          //         text: 'Date',
          //         iconPath: 'assets/icons/calendar_month.svg',
          //       ),
          //     ),
          //     10.horizontalSpace,
          //     Expanded(
          //       child: CustomButton.withIcon(
          //         onPressed: () => cubit.addCurrentTimeInMessage(),
          //         text: 'Time',
          //         iconPath: 'assets/icons/avg_pace.svg',
          //       ),
          //     ),
          //     10.horizontalSpace,
          //     Expanded(
          //       child: CustomButton.withIcon(
          //         onPressed: () => cubit.addMessageIDInMessage(),
          //         text: 'Message ID',
          //         iconPath: 'assets/icons/tag.svg',
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }

  Future<dynamic> buildBottomSheet(BuildContext context,
      List<Template>? templates, StartCampaginCubit cubit) {
    return showModalBottomSheet(
      
        context: context,
        builder: (context) {
          return BlocProvider.value(
            value: cubit,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorsManager.darkBackGround,
                borderRadius:
                    BorderRadiusDirectional.vertical(top: Radius.circular(18)),
              ),
              height: context.height * 0.5,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.read<StartCampaginCubit>().selectTemplate(
                            templates?[index] ?? Template(),
                          );
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TemplateItem(
                        template: templates?[index] ?? Template(),
                      ),
                    ),
                  );
                },
                itemCount: templates?.length ?? 0,
              ),
            ),
          );
        });
  }
}
