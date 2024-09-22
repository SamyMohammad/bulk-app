import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audience.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/manage_audiances_widgets/audiance_item.dart';
import 'package:bulk_app/features/start_campains/logic/start_campagin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class ChooseCsvFileOrSelectAudianceContainer extends StatefulWidget {
  const ChooseCsvFileOrSelectAudianceContainer({
    super.key,
  });

  @override
  State<ChooseCsvFileOrSelectAudianceContainer> createState() =>
      _ChooseCsvFileOrSelectAudianceContainerState();
}

class _ChooseCsvFileOrSelectAudianceContainerState
    extends State<ChooseCsvFileOrSelectAudianceContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartCampaginCubit, StartCampaginState>(
      buildWhen: (previous, current) {
        return current is SelectedAudience;
      },
      builder: (context, state) {
        final cubit = context.read<StartCampaginCubit>();
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
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
                  'Select Numbers',
                  style: TextStyles.font24limeExtraBold,
                ),
              ),
              6.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomButton.withIcon(
                        text: 'Select Contacts',
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        fontSize: 14.sp,
                        onPressed: () {
                          buildBottomSheet(
                              context,
                              context.read<StartCampaginCubit>().audiences,
                              cubit);
                        },
                        backgroundColor: const Color(0xFF10B981),
                        iconPath: 'assets/icons/description.svg'),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: CustomButton.withIcon(
                        text: 'Choose File',
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        fontSize: 14.sp,
                        backgroundColor: ColorsManager.teal400,
                        onPressed: () {},
                        iconPath: 'assets/icons/contact_page.svg'),
                  ),
                ],
              ),
              if (cubit.selectedAudience != null) 10.verticalSpace,
              if (cubit.selectedAudience != null)
                Text(
                  "Name: ${cubit.selectedAudience?.name ?? ''}",
                  textAlign: TextAlign.center,
                  style: TextStyles.font17whiteMedium,
                ),
              if (cubit.selectedAudience != null)
                Text(
                    'Total Numbers: ${cubit.selectedAudience?.contacts?.length ?? 0}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorsManager.saerchTextFieldHintColor,
                        fontSize: 15.sp)),
              if (cubit.selectedAudience != null) 5.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> buildBottomSheet(BuildContext context,
      List<Audience>? audiences, StartCampaginCubit cubit) {
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
                      context.read<StartCampaginCubit>().selectAudience(
                            audiences?[index] ?? Audience(),
                          );
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: AudianceItem(
                        audiences: audiences?[index] ?? Audience(),
                        index: index,
                      ),
                    ),
                  );
                },
                itemCount: audiences?.length ?? 0,
              ),
            ),
          );
        });
  }
}
