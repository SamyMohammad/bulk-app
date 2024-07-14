import 'package:bulk_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/styles.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.darkBackGround,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: SvgPicture.asset('assets/images/asset 0.svg'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w),
            child: Text(
              'MetaB',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset('assets/images/asset 3.svg'),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'Start Campaign',
                    style: TextStyles.font15whiteMedium,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset('assets/images/asset 4.svg'),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'Manage Audiences',
                    style: TextStyles.font15whiteMedium,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset('assets/images/asset 5.svg'),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'Templates',
                    style: TextStyles.font15whiteMedium,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/asset 6.svg',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'Campaigns History',
                    style: TextStyles.font15whiteMedium,
                  ),
                ),
              ],
            ),
          ),
          ...buildsuperToolsListTiles(),
          ...buildsupportListTiles()
        ],
      ),
    );
  }

  buildsuperToolsListTiles() {
    List<Widget> superToolsWidgets = [
      Padding(
        padding: EdgeInsets.only(left: 8.0.w),
        child: Text(
          'MetaB',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ),
      ListTile(
        title: Row(
          children: [
            SvgPicture.asset('assets/images/asset 3.svg'),
            Text(
              'Start Campaign',
              style: TextStyles.font15whiteMedium,
            ),
          ],
        ),
      ),
      ListTile(
        title: Row(
          children: [
            SvgPicture.asset('assets/images/asset 4.svg'),
            Text(
              'Manage Audiences',
              style: TextStyles.font15whiteMedium,
            ),
          ],
        ),
      ),
      ListTile(
        title: Row(
          children: [
            SvgPicture.asset('assets/images/asset 4.svg'),
            Text(
              'Manage Audiences',
              style: TextStyles.font15whiteMedium,
            ),
          ],
        ),
      ),
      ListTile(
        title: Row(
          children: [
            SvgPicture.asset('assets/images/asset 4.svg'),
            Text(
              'Manage Audiences',
              style: TextStyles.font15whiteMedium,
            ),
          ],
        ),
      ),
    ];
    return superToolsWidgets;
  }

  buildsupportListTiles() {
    List<Widget> supportWidgets = [
      Padding(
        padding: EdgeInsets.only(left: 8.0.w),
        child: Text(
          'MetaB',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ),
      ListTile(
        title: Row(
          children: [
            SvgPicture.asset('assets/images/asset 3.svg'),
            Text(
              'Start Campaign',
              style: TextStyles.font15whiteMedium,
            ),
          ],
        ),
      )
    ];
    return supportWidgets;
  }
}
