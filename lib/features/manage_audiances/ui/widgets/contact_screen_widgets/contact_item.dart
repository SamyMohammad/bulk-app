import 'package:bulk_app/core/helpers/date_helper.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/manage_audiances/data/models/contacts.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key, required this.contact});
  final Contact contact;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      alignment: Alignment.center,
      height: context.height * 0.11,
      decoration: BoxDecoration(
          color: ColorsManager.darkAppBarBackGround,
          borderRadius: const BorderRadius.all(
            Radius.circular(21),
          ),
          border: Border.all(color: ColorsManager.saerchTextFieldHintColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            //Todo: Avatar needs to be Changed When getting images of contacts
            backgroundColor: Colors.white,
            radius: 30.h,
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.name ?? AppStrings.name.tr(),
                style: TextStyles.font15whiteMedium.copyWith(fontSize: 18.sp),
              ),
              1.sizedBoxHeight,
              Text(
                contact.phone ?? AppStrings.phone.tr(),
                style: TextStyle(
                    color: ColorsManager.saerchTextFieldHintColor,
                    fontSize: 12.sp),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.read<ContactScreenCubit>().removeContact(contact);
            },
            child: Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 37.r,
            ),
          ),
        ],
      ),
    );
  }
}
