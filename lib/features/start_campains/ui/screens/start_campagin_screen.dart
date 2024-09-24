import 'package:bulk_app/core/helpers/route_observer.dart';
import 'package:bulk_app/core/widgets/custom_app_bar.dart';
import 'package:bulk_app/features/start_campains/logic/start_campagin_cubit.dart';
import 'package:bulk_app/features/start_campains/ui/widgets/add_files_container.dart';
import 'package:bulk_app/features/start_campains/ui/widgets/choose_File_or_select_audiance_container.dart';
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
  @override
  void initState() {
    super.initState();
    Future.wait([
      context.read<StartCampaginCubit>().fetchAudienceList(),
      context.read<StartCampaginCubit>().emitGetAllTemplatesStates(),
    ]);
  }

  @override
  void didPopNext() {
    // TODO: implement didPopNext
    super.didPopNext();
    print('didPopNext--');
    Future.wait([
      context.read<StartCampaginCubit>().fetchAudienceList(),
      context.read<StartCampaginCubit>().emitGetAllTemplatesStates(),
    ]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ObserverUtils.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
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
              15.verticalSpace,
              const AddFilesContainer(),
              15.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
