import 'package:bulk_app/core/helpers/route_observer.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/widgets/custom_app_bar.dart';
import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:bulk_app/features/start_campains/logic/start_campagin_cubit.dart';
import 'package:bulk_app/features/start_campains/ui/widgets/choose_File_or_select_audiance_container.dart';
import 'package:bulk_app/features/start_campains/ui/widgets/create_campain_listener.dart';
import 'package:bulk_app/features/start_campains/ui/widgets/manage_contacts_and_templates_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/message_container.dart';

class StartCampaginScreen extends StatefulWidget {
  const StartCampaginScreen({super.key});

  @override
  State<StartCampaginScreen> createState() => _StartCampaginScreenState();
}

class _StartCampaginScreenState extends State<StartCampaginScreen>
    with RouteAware {
  late final int? id;
  @override
  void initState() {
    super.initState();
    Future.wait([
      context.read<StartCampaginCubit>().fetchAudienceList(),
      context.read<StartCampaginCubit>().emitGetAllTemplatesStates(),
    ]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      id = ModalRoute.of(context)!.settings.arguments as int?;
      print("id here--$id");
    });
  }

  @override
  void didPopNext() {
    // TODO: implement didPopNext
    super.didPopNext();
    final cubit = context.read<StartCampaginCubit>();
    print('didPopNext--');
    Future.wait([
      cubit.fetchAudienceList(),
      cubit.emitGetAllTemplatesStates(),
    ]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ObserverUtils.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  ValueNotifier<bool> isFormValid = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    isFormValid.value =
        context.read<StartCampaginCubit>().selectedAudience != null &&
            context.read<StartCampaginCubit>().selectedTemplate != null;

    return Scaffold(
      appBar: const MyCustomAppBar(title: 'StartCampagin'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ManageContactsAndTemplatesButtonsRow(
                cubit: context.read<StartCampaginCubit>(),
              ),
              // 15.verticalSpace,
              const ChooseCsvFileOrSelectAudianceContainer(),
              15.verticalSpace,
              const MessageContainer(),
              20.verticalSpace,
              ValueListenableBuilder<bool>(
                valueListenable: isFormValid,
                builder: (context, isValid, child) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton.withIcon(
                      iconPath: null,
                      icon: Icons.send,
                      isDisabled: !isValid,
                      text: 'Start',
                      textColor: Colors.black87,
                      fontSize: 22.sp,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.h, vertical: 2),
                      onPressed: () {
                        context.read<StartCampaginCubit>()
                          ..emitCreateCampaignStates(id ?? 0)
                          ..emitToggleCampaignStates(id ?? 0);
                      },
                      backgroundColor: !isValid
                          ? const Color.fromRGBO(255, 255, 255, 0.702)
                          : ColorsManager.containerTitleColor,
                      textDirection: TextDirection.rtl,
                    ),
                  );
                },
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: CustomButton.withIcon(
              //     iconPath: null,
              //     icon: Icons.send,
              //     isDisabled: false,
              //     text: 'Start',
              //     textColor: Colors.black87,
              //     fontSize: 22.sp,
              //     padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 2),
              //     onPressed: () => context.read<StartCampaginCubit>(),
              //     backgroundColor: false
              //         ? Colors.white60
              //         : ColorsManager.containerTitleColor,
              //     textDirection: TextDirection.rtl,
              //   ),
              // )
              // const AddFilesContainer(),
              // 15.verticalSpace,
              const CreateCampainListener(),
            ],
          ),
        ),
      ),
    );
  }
}
