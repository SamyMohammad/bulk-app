import 'package:animate_do/animate_do.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/test/simulate_account.dart';
import 'package:bulk_app/core/widgets/custom_app_bar.dart';
import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:bulk_app/features/account_settings/widgets/show_screen_function.dart';
import 'package:bulk_app/features/home/ui/widgets/drawer.dart';
import 'package:bulk_app/features/home/ui/widgets/home_container.dart';
import 'package:bulk_app/features/home/ui/widgets/smart_tools_container.dart';
import 'package:bulk_app/features/home/ui/widgets/whatsapp_number_text_field.dart';
import 'package:bulk_app/features/shared/logic/cubit/shared_controller_cubit.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late StreamSubscription<CampaignStatus> campaignStream;
  bool isThereActiveCampaign = false;

  @override
  void dispose() {
    // campaignStream.cancel();
    super.dispose();
  }

  late SharedControllerCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<SharedControllerCubit>();
    // cubit.emitSubscribeAccountSSEStates("22cf67e5-5322-4dcd-afcc-225c555dba1f");
    cubit.listenToSSE("dc5d10dc-b11f-46e2-90f3-24cbbe2447c0");
    cubit.emitgetAllAccountsStates();
    cubit.checkConnectivity();
    // final campaignMocker = CampaignMocker(const Duration(seconds: 2));
    // campaignStream = campaignMocker.campaignStream.listen((status) {
    //   print('Campaign status: $status');
    // });
  }

  Widget getWidgetForState(String stateName) {
    switch (stateName) {
      case "noAccount":
        if (cubit.getAllAccountsRm == null ||
            cubit.getAllAccountsRm!.accounts.isNullOrEmpty()) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Oops! No account detected. Please add an account to proceed.",
                  style: TextStyles.font15whiteMedium,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                ),
              ),
              Image.asset(
                "assets/images/icons8-disconnect-80.png",
                height: 120,
                width: 120,
              )
            ],
          );
        }
      case "connecting":
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Connecting your account... Please wait.",
                style: TextStyles.font15whiteMedium,
                overflow: TextOverflow.clip,
                softWrap: true,
              ),
            ),
            Lottie.asset(
              'assets/jsons/Animation - 1727602117729.json',
              repeat: true,
              height: 100,
              width: 100,
            )
          ],
        );
      case "disconnected":
        if (cubit.getAllAccountsRm != null &&
            cubit.getAllAccountsRm!.accounts.isNotNullAndNotEmpty()) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "It seems your account is disconnected. wait for qr code to logging in.",
                  style: TextStyles.font15whiteMedium,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                ),
              ),
              Lottie.asset(
                'assets/jsons/Animation - 1727602117729.json',
                repeat: true,
                height: 100,
                width: 100,
              )
            ],
          );
        }

      case "qrcode":
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Scan the QR code to connect your account.",
                style: TextStyles.font15whiteMedium,
                overflow: TextOverflow.clip,
                softWrap: true,
              ),
            ),
            const Icon(
              Icons.qr_code,
              color: ColorsManager.containerTitleColor,
              size: 100,
            )
          ],
        );
      case "connected":
        return Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if (!connectedIsLoaded)
            // Expanded(
            //   child: Lottie.asset(
            //     'assets/jsons/connected.json',
            //     repeat: true,
            //     height: 70,
            //     width: 70,
            //     reverse: false,
            //   ),
            // ),
            Text(
              "+0020155636985",
              style: TextStyles.font15limeExtraBold,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              // overflow: TextOverflow.clip,
              softWrap: true,
            ),
            SizedBox(width: 15.w),
            Stack(
              children: [
                // Expanded(
                Lottie.asset(
                  'assets/jsons/connected.json',
                  repeat: true,
                  height: 50,
                  width: 50,
                  reverse: false,
                ),

                // Image.asset(
                //   "assets/images/icons8-seen-48.png",
                //   height: 30,
                //   width: 30,
                // ),
              ],
            ),
          ],
        );

      default:
        return const SizedBox
            .shrink(); // Return an empty widget if no state matches
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return BlocConsumer<SharedControllerCubit, SharedControllerState>(
      listener: (context, state) {
        if (state is ConnectivityState && state.isConnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("You are connected"),
            ),
          );
        }
        if (state is ConnectivityState && !state.isConnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("You are not connected"),
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<SharedControllerCubit>();
        return SafeArea(
            child: Scaffold(
          drawer: const HomeDrawer(),
          appBar: MyCustomAppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.settings, size: 30.r),
                onPressed: () {
                  showDropdownScreen(context);
                },
              ),
            ],
            isHome: false,
            title: AppStrings.homeTitle.tr(),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: ListView(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  children: [
                    HomeContainer(
                      // heightContainer: 300.h,
                      fromAnimation: 50,
                      animationDuration: 1000,
                      title: "Account Info",
                      body: BlocBuilder<MockAccountCubit, AccountStatus>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              getWidgetForState(state.name),
                              const SizedBox(
                                height: 20,
                              ),
                              if (cubit.getAllAccountsRm?.accounts
                                      .isNullOrEmpty() ??
                                  true)
                                const SizedBox(
                                  height: 5,
                                ),
                              if (cubit.getAllAccountsRm?.accounts
                                      .isNullOrEmpty() ??
                                  true)
                                CustomButton.withoutIcon(
                                  textColor: Colors.white,
                                  fontSize: 12.sp,
                                  backgroundColor:
                                      ColorsManager.containerTitleColor,
                                  onPressed: () {
                                    context
                                        .read<MockAccountCubit>()
                                        .addAccount();
                                    cubit.emitAddAccountStates();
                                  },
                                  text: "Add Account",
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 8),
                                ),
                              if (state.name == "connected")
                                Text(
                                  "Campains info",
                                  style: TextStyles.font16GreenExtraBold,
                                ),
                              if (state.name == "connected")
                                SizedBox(
                                  height: 15.h,
                                ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (cubit.getCampainRm?.data?.campaign ==
                                              null &&
                                          cubit.getAllAccountsRm != null &&
                                          cubit.getAllAccountsRm!.accounts
                                              .isNotNullAndNotEmpty() &&
                                          state.name == "connected"
                                      // TODO: add this condition
                                      //  && cubit.getAllAccountsRm!.accounts?.first.status == "connected"
                                      )
                                    Expanded(
                                      child: Text(
                                        "No campaigns are live at the moment. Start one now!",
                                        style: TextStyles.font12witeRegular,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center,
                                        // overflow: TextOverflow.clip,
                                        softWrap: true,
                                      ),
                                    ),
                                  SizedBox(width: 10.w),
                                  if (!isThereActiveCampaign &&
                                      state.name == "connected")
                                    CustomButton.withoutIcon(
                                      textColor: Colors.white,
                                      fontSize: 12.sp,
                                      backgroundColor:
                                          ColorsManager.containerTitleColor,
                                      onPressed: () {
                                        context.pushNamed(
                                            Routes.startCampaginScreen,
                                            arguments: context
                                                .read<SharedControllerCubit>()
                                                .getAllAccountsRm
                                                ?.accounts
                                                ?.first
                                                .id);
                                      },
                                      text: "Start Campaign",
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                    ),
                                  if (isThereActiveCampaign &&
                                      state.name == "connected")
                                    Expanded(
                                      child: Text(
                                        "Campaign ongoing ...\n Track its progress in real-time.",
                                        style: TextStyles.font12witeRegular,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center,
                                        // overflow: TextOverflow.clip,
                                        softWrap: true,
                                      ),
                                    ),
                                  if (isThereActiveCampaign &&
                                      state.name == "connected")
                                    LinearPercentIndicator(
                                      width: 170.0,
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 20.0,
                                      // leading: const Text("left content"),
                                      // trailing: const Text("right content"),
                                      percent: 0.2,
                                      center: const Text("20.0%"),
                                      // linearStrokeCap: LinearStrokeCap.butt,
                                      barRadius: const Radius.circular(20),
                                      progressColor: Colors.green,
                                    ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // BlocBuilder<MockAccountCubit, AccountStatus>(
                    //     builder: (context, status) {
                    //   switch (status) {
                    //     case AccountStatus.noAccount:
                    //       return Center(
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             const Text('No Account Found'),
                    //             const SizedBox(height: 20),
                    //             ElevatedButton(
                    //               onPressed: () {
                    //                 context
                    //                     .read<MockAccountCubit>()
                    //                     .addAccount();
                    //               },
                    //               child: const Text('Add Account'),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     case AccountStatus.disconnected:
                    //       return const Center(
                    //           child: Text('Account is Disconnected'));
                    //     case AccountStatus.connecting:
                    //       return const Center(child: Text('Connecting...'));
                    //     case AccountStatus.qrcode:
                    //       return const Center(
                    //           child: Icon(Icons.qr_code,
                    //               size: 100)); // Show QR code
                    //     case AccountStatus.connected:
                    //       return Container(
                    //         // width: 100,
                    //         padding: const EdgeInsets.symmetric(
                    //             vertical: 5,
                    //             horizontal:
                    //                 5), // Adds padding inside the container
                    //         // width:
                    //         //     200, // Adjust the size of the outer container
                    //         // height: 100,
                    //         decoration: BoxDecoration(
                    //           border: Border.all(
                    //               color: Colors.green,
                    //               width: 3), // Green outline
                    //           borderRadius:
                    //               BorderRadius.circular(15), // Rounded corners
                    //         ),
                    //         child: Row(
                    //           mainAxisSize: MainAxisSize.min,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Container(
                    //               width: 15, // Size of the inner circle
                    //               height: 15,
                    //               decoration: const BoxDecoration(
                    //                 color: Colors
                    //                     .green, // Circle color indicating connected
                    //                 shape: BoxShape.circle, // Circular shape
                    //               ),
                    //             ),
                    //             const SizedBox(
                    //                 width: 10), // Space between circle and text
                    //             const Text(
                    //               "Connected",
                    //               style: TextStyle(
                    //                 color: Colors
                    //                     .green, // Text color to match the connected state
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 15,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       );

                    //   }
                    // })
                    //       default:
                    //         return const Center(child: Text('Unknown Status'));
                    //     }
                    //   },
                    // ),
                    // TODO: add status indicator ♥
                    // Positioned(
                    //   bottom: 0,
                    //   right: isRtl ? null : 0,
                    //   left: isRtl ? 0 : null,
                    //   child: FadeInLeft(
                    //     from: 75,
                    //     animate: true,
                    //     duration: const Duration(milliseconds: 1000),
                    //     delay: const Duration(milliseconds: 1600),
                    //     child: SlideInLeft(
                    //       from: 75,
                    //       animate: true,
                    //       duration: const Duration(milliseconds: 1000),
                    //       delay: const Duration(milliseconds: 1600),
                    //       child: Transform.flip(
                    //         flipX: isRtl,
                    //         child: const VectorGraphic(
                    //           loader: AssetBytesLoader(
                    //             'assets/icons/asset 1.svg',
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
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
                            isCampaginHistory: true,
                            onTap: () {},
                            title: AppStrings.campaignsHistory.tr(),
                            iconName: 'assets/icons/asset 6.svg',
                          ),
                        ),
                        BounceInRight(
                          delay: const Duration(milliseconds: 2200),
                          animate: true,
                          child: SmartToolsContainer(
                            onTap: () => context.pushNamed(
                              Routes.templatesScreen,
                            ),
                            isCampaginHistory: false,
                            title: AppStrings.templates.tr(),
                            iconName: 'assets/icons/asset 5.svg',
                          ),
                        ),
                        BounceInRight(
                          delay: const Duration(milliseconds: 2400),
                          animate: true,
                          child: SmartToolsContainer(
                            onTap: () =>
                                context.pushNamed(Routes.manageAudiances),
                            isCampaginHistory: false,
                            title: AppStrings.manageAudiences.tr(),
                            iconName: 'assets/icons/asset 4.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
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
              ],
            ),
          ),
        ));
      },
    );
  }
}
