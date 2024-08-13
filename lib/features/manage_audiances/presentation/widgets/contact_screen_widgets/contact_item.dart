import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/manage_audiances/models/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key, required this.contact});
  final Contacts contact;
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
                contact.name ?? 'Name',
                style: TextStyles.font15whiteMedium.copyWith(fontSize: 18.sp),
              ),
              1.sizedBoxHeight,
              Text(
                contact.phone ?? 'Phone',
                style: TextStyle(
                    color: ColorsManager.saerchTextFieldHintColor,
                    fontSize: 12.sp),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // context.read<ContactScreenCubit>().deleteContact(contact.phone)
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
