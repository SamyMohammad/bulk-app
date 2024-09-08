import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/features/account_settings/logic/cubit/account_settings_cubit.dart';
import 'package:bulk_app/features/account_settings/widgets/account_settings_screen_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          title: AppStrings.manageAudiences.tr(),
        ),
        body: BlocProvider(
          create: (context) => AccountSettingsCubit(),
          child: const AccountSettingsScreenBody(),
        ));
  }
}
