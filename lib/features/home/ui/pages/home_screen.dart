import 'package:animate_do/animate_do.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/widgets/custom_app_bar.dart';
import 'package:bulk_app/features/home/ui/widgets/drawer.dart';
import 'package:bulk_app/features/home/ui/widgets/home_container.dart';
import 'package:bulk_app/features/home/ui/widgets/smart_tools_container.dart';
import 'package:bulk_app/features/home/ui/widgets/whatsapp_number_text_field.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return SafeArea(
      child: Scaffold(
        drawer: const HomeDrawer(),
        appBar: MyCustomAppBar(
          isHome: true,
          title: AppStrings.homeTitle.tr(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  children: [
                    HomeContainer(
                      fromAnimation: 50,
                      animationDuration: 1000,
                      title: AppStrings.bulkTitle.tr(),
                      body: Text(
                        AppStrings.bulkDescription.tr(),
                        style: TextStyles.font15whiteMedium,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Positioned(
                      bottom: 0,
                      right: isRtl ? null : 0,
                      left: isRtl ? 0 : null,
                      child: FadeInLeft(
                        from: 75,
                        animate: true,
                        duration: const Duration(milliseconds: 1000),
                        delay: const Duration(milliseconds: 1600),
                        child: SlideInLeft(
                          from: 75,
                          animate: true,
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 1600),
                          child: Transform.flip(
                            flipX: isRtl,
                            child: SvgPicture.asset(
                              'assets/images/asset 1.svg',
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                HomeContainer(
                  fromAnimation: 100,
                  animationDuration: 1000,
                  title: AppStrings.directChatTitle.tr(),
                  heightContainer: context.height * .23,
                  body: Column(
                    children: [
                      Text(
                        AppStrings.homeDirectChatDescription.tr(),
                        style: TextStyles.font15whiteMedium,
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Row(
                        children: [
                          const Expanded(child: WhatsAppNumberTextField()),
                          SizedBox(
                            width: 8.w,
                          ),
                          IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                                backgroundColor:
                                    ColorsManager.containerTitleColor),
                            icon: const Icon(
                              Icons.send,
                              color: Color(0xFF1e293b),
                            ),
                            tooltip: AppStrings.sendButtonTooltip.tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                HomeContainer(
                  fromAnimation: 150,
                  animationDuration: 1000,
                  heightContainer: context.height * .22,
                  title: AppStrings.superToolsTitle.tr(),
                  body: Padding(
                    padding: EdgeInsets.only(top: 11.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BounceInRight(
                          animate: true,
                          delay: const Duration(milliseconds: 2000),
                          child: SmartToolsContainer(
                            title: AppStrings.whatsBot.tr(),
                            iconName: 'assets/images/asset 7.svg',
                          ),
                        ),
                        BounceInRight(
                          delay: const Duration(milliseconds: 2200),
                          animate: true,
                          child: SmartToolsContainer(
                            title: AppStrings.groupsGrabber.tr(),
                            iconName: 'assets/images/asset 8.svg',
                          ),
                        ),
                        BounceInRight(
                          delay: const Duration(milliseconds: 2400),
                          animate: true,
                          child: SmartToolsContainer(
                            title: AppStrings.contactsGrabber.tr(),
                            iconName: 'assets/images/asset 9.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
