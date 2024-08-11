import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

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
          ...buildMetabListTiles(context),
          ...buildsuperToolsListTiles(),
          ...buildsupportListTiles()
        ],
      ),
    );
  }

  buildMetabListTiles(BuildContext context) {
    List<Widget> metabList = [
      Container(
        height: 200,
        padding: const EdgeInsets.only(top: 25),
        child: const Center(
          child: VectorGraphic(
            loader: AssetBytesLoader('assets/images/asset 0.svg'),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8.0.w),
        child: Text(
          'MetaB',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ),
      DrawerListTile(
        onTap: () {},
        iconPath: 'assets/images/asset 3.svg',
        title: AppStrings.startCampaign.tr(),
      ),
      DrawerListTile(
        onTap: () => Navigator.of(context).pushNamed(Routes.manageAudiances),
        iconPath: 'assets/images/asset 4.svg',
        title: AppStrings.manageAudiences.tr(),
      ),
      DrawerListTile(
        onTap: () => Navigator.of(context).pushNamed(Routes.templatesScreen),
        iconPath: 'assets/images/asset 5.svg',
        title: AppStrings.templates.tr(),
      ),
      DrawerListTile(
        onTap: () {},
        iconPath: 'assets/images/asset 6.svg',
        title: AppStrings.campaignsHistory.tr(),
      ),
    ];
    return metabList;
  }

  buildsuperToolsListTiles() {
    List<Widget> superToolsWidgets = [
      Padding(
        padding: EdgeInsets.only(left: 8.0.w),
        child: Text(
          'Super Tools',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ),
      DrawerListTile(
        onTap: () {},
        iconPath: 'assets/images/asset 7.svg',
        title: AppStrings.whatsBot.tr(),
      ),
      DrawerListTile(
        onTap: () {},
        iconPath: 'assets/images/asset 8.svg',
        title: AppStrings.groupsGrabber.tr(),
      ),
      DrawerListTile(
        onTap: () {},
        iconPath: 'assets/images/asset 9.svg',
        title: AppStrings.contactsGrabber.tr(),
      ),
    ];
    return superToolsWidgets;
  }

  buildsupportListTiles() {
    List<Widget> supportWidgets = [
      Padding(
        padding: EdgeInsets.only(left: 8.0.w),
        child: Text(
          'Support',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ),
      DrawerListTile(
        onTap: () {},
        iconPath: 'assets/images/asset 10.svg',
        title: AppStrings.support.tr(),
      ),
      DrawerListTile(
        onTap: () {},
        iconPath: 'assets/images/asset 11.svg',
        title: AppStrings.tellAFriend.tr(),
      ),
      DrawerListTile(
        onTap: () {},
        iconPath: 'assets/images/asset 12.svg',
        title: AppStrings.feedback.tr(),
      ),
      DrawerListTile(
        onTap: () {},
        iconPath: 'assets/images/asset 13.svg',
        title: AppStrings.termsOfUse.tr(),
      ),
    ];
    return supportWidgets;
  }
}

class DrawerListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String iconPath;
  const DrawerListTile(
      {super.key, this.onTap, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Row(
          children: [
            SvgPicture.asset(iconPath),
            15.horizontalSpace,
            Text(
              title,
              style: TextStyles.font15whiteMedium,
            ),
          ],
        ),
      ),
    );
  }
}
