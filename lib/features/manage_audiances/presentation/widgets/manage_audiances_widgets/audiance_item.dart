import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/manage_audiances/models/audiences.dart';
import 'package:bulk_app/features/manage_audiances/presentation/cubits/manage_audience_cubit/manage_audience_cubit.dart';
import 'package:bulk_app/features/manage_audiances/presentation/cubits/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/presentation/pages/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudianceItem extends StatelessWidget {
  const AudianceItem({super.key, required this.audiences});
  final Audiences audiences;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                audiences.created_at ?? 'date',
                style: TextStyle(
                  color: ColorsManager.saerchTextFieldHintColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.read<ManageAudiancesCubit>().delete(audiences.id!);
            },
            child: Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 37.r,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            height: double.maxFinite,
            width: 1.w,
            color: ColorsManager.saerchTextFieldHintColor,
          ),
          5.sizedWidth,
          Container(
            height: 26.h,
            width: 26.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.containerTitleColor,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider(
                        create: (context) {
                          final cubit = getIt<ContactScreenCubit>();
                          cubit.init(audiences.contacts!);
                          return cubit;
                        },
                        child: const ContactScreen(),
                      );
                    },
                  ),
                );
              },
              child: Icon(
                Icons.edit_rounded,
                size: 20.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
