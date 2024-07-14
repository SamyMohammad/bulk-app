import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHome;
  final List<Widget>? actions;
  const MyCustomAppBar(
      {super.key, required this.title, this.isHome = false, this.actions});

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
      iconTheme: const IconThemeData(color: Colors.white),
      // title: isHome
      // ? RichText(
      //     text: TextSpan(
      //       children: <TextSpan>[
      //         TextSpan(text: 'META ', style: TextStyles.font26whiteRegular),
      //         TextSpan(
      //           style: TextStyles.font26whiteRegular
      //               .copyWith(color: ColorsManager.containerTitleColor),
      //           text: 'B',
      //         ),
      //       ],
      //     ),
      //   )
      //     : Text(title),
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
      actions: actions,
    );
  }
}
