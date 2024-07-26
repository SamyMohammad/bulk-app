import 'package:bulk_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddContactsButton extends StatelessWidget {
  const AddContactsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66.h,
      width: 66.w,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.containerTitleColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: IconButton(
          icon: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.person,
                  size: 50.h,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.add,
                  size: 27.h,
                ),
              ),
            ],
          ),
          color: ColorsManager.darkBackGround,
          onPressed: () {},
        ),
      ),
    );
  }
}
