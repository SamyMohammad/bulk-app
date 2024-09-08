import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audience.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_audience_cubit/manage_audiances_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/pages/manage_audiances_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AudianceItem extends StatelessWidget {
  const AudianceItem({super.key, required this.audiences, required this.index});
  final Audience audiences;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        dragDismissible: false,
        motion: const ScrollMotion(),
        extentRatio: .3,
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(18.r),

            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) =>
                context.read<ManageAudiancesCubit>().delete(audiences.id!),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(
        dragDismissible: false,
        extentRatio: .3,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            borderRadius: BorderRadius.circular(18.r),
            spacing: 3,
            onPressed: (context) {
              Navigator.of(context).pushNamed(Routes.conatctScreen,
                  arguments: Arguments(
                      isAddNewAudience: false,
                      audienceId: audiences.id!.toString(),
                      audienceName: audiences.name));
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        alignment: Alignment.center,
        height: context.height * 0.11,
        decoration: BoxDecoration(
          color: ColorsManager.darkAppBarBackGround,
          borderRadius: const BorderRadius.all(Radius.circular(21)),
          border: Border.all(color: ColorsManager.saerchTextFieldHintColor),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  audiences.name ?? 'name',
                  style: TextStyles.font15whiteMedium.copyWith(fontSize: 18.sp),
                ),
                1.sizedBoxHeight,
                Text(
                  audiences.createdAt ?? 'date',
                  style: TextStyle(
                    color: ColorsManager.saerchTextFieldHintColor,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
