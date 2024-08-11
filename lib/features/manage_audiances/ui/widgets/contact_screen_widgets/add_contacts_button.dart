import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/message_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddContactsButton extends StatelessWidget {
  const AddContactsButton({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.containerTitleColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: IconButton(
        icon: SvgPicture.asset(
          path,
          width: 40.r,
          height: 40.r,
        ),
        color: ColorsManager.darkBackGround,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const MessageBody();
              });
        },
      ),
    );
  }
}
