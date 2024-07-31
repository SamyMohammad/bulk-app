import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/add_template_screen_widgets/add_template_body.dart';

class AddTemplatesScreen extends StatefulWidget {
  const AddTemplatesScreen({super.key});

  @override
  State<AddTemplatesScreen> createState() => _AddTemplatesScreenState();
}

class _AddTemplatesScreenState extends State<AddTemplatesScreen> {
  late AddTemplateCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddTemplateCubit>();
    cubit.templateNameController.addListener(() {
      cubit.validateTemplate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          actions: [
            BlocBuilder<AddTemplateCubit, AddTemplateState>(
              builder: (context, state) {
                return state.maybeWhen(
                    stateOfButton: (isValid) {
                      return IconButton(
                          onPressed: isValid
                              ? () => cubit.emitAddTemplateStates()
                              : null,
                          icon: Icon(
                            Icons.check_circle_rounded,
                            color: isValid ? Colors.green : null,
                            size: 40.r,
                          ));
                    },
                    orElse: () => IconButton(
                          onPressed:null,
                          icon: Icon(
                            Icons.check_circle_rounded,
                            color:  null,
                            size: 40.r,
                          )));
              },
            )
          ],
          title: AppStrings.manageAudiences.tr(),
        ),
        body: const SingleChildScrollView(child: AddTemplateBody()));
  }
}
