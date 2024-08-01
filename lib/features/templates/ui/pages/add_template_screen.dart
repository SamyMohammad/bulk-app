import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
import 'package:bulk_app/features/templates/ui/widgets/templates_screen_widgets/template_item.dart';
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
  bool isEdit = false;
  @override
  void initState() {
    super.initState();

    cubit = context.read<AddTemplateCubit>();
    if (isEdit) {
      cubit.initControllers();
    }
    cubit.templateNameController.addListener(() {
      cubit.validateTemplate();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final templateArgs =
        ModalRoute.of(context)!.settings.arguments as AddTemplateArgs?;
    isEdit = templateArgs?.isEdit??false;
    if (isEdit) {
      cubit.emitGetTemplatesByIdStates(templateArgs?.id??0);
    }
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
                        onPressed: null,
                        icon: Icon(
                          Icons.check_circle_rounded,
                          color: null,
                          size: 40.r,
                        )));
              },
            )
          ],
          title: AppStrings.manageAudiences.tr(),
        ),
        body: const AddTemplateBody());
  }
}
