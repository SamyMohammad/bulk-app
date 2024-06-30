import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyCustomAppBar({super.key, required this.title});

  // Here's the magic! Tell Flutter the preferred size
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(19.sp),
          bottomRight: Radius.circular(19.sp),
        ),
      ),
      backgroundColor: ColorsManager.darkAppBarBackGround,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: 'META ', style: TextStyles.font26whiteRegular),
            TextSpan(
              style: TextStyles.font26whiteRegular
                  .copyWith(color: ColorsManager.containerTitleColor),
              text: 'B',
            ),
          ],
        ),
      ),
    );
  }
}
