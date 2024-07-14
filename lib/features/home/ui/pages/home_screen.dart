import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/home/ui/widgets/drawer.dart';
import 'package:bulk_app/features/home/ui/widgets/home_app_bar.dart';
import 'package:bulk_app/features/home/ui/widgets/home_container.dart';
import 'package:bulk_app/features/home/ui/widgets/smart_tools_container.dart';
import 'package:bulk_app/features/home/ui/widgets/whatsapp_number_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const HomeDrawer(),
        
        
        appBar: const MyCustomAppBar(
          title: 'Home',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  HomeContainer(
                    title: 'Bulk',
                    body: Text(
                      "Start your campaign \nwith sending \nbulk messages",
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
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/images/asset 1.svg',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              HomeContainer(
                title: 'Direct Chat',
                heightContainer: context.height * .23,
                body: Column(
                  children: [
                    Text(
                      "Enter any number on Whatsapp  \n           try with your number",
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
                        )
                      ],
                    )
                  ],
                ),
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              HomeContainer(
                  heightContainer: context.height * .22,
                  title: 'Super Tools',
                  body: Padding(
                    padding: EdgeInsets.only(top: 11.h),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SmartToolsContainer(
                          title: 'WhatsBots',
                          iconName: 'assets/images/asset 7.svg',
                        ),
                        SmartToolsContainer(
                          title: 'Groups \nGrabber',
                          iconName: 'assets/images/asset 8.svg',
                        ),
                        SmartToolsContainer(
                          title: 'Contacts \nGrabber',
                          iconName: 'assets/images/asset 9.svg',
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const HomeAppBar({
//     super.key,
//   })

//   @override
//   Size get preferredSize {return  const Size.fromHeight(100);}
//   @override
//   Widget build(BuildContext context) {

//   }

// }


