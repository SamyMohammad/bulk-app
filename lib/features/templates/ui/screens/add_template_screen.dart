import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/widgets/overlay_loading_state.dart';
import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/add_template_screen_widgets/add_template_body.dart';

class AddTemplatesScreen extends StatefulWidget {
  final bool isEdit;
  final int? templateId;

  const AddTemplatesScreen({super.key, required this.isEdit, this.templateId});

  @override
  State<AddTemplatesScreen> createState() => _AddTemplatesScreenState();
}

class _AddTemplatesScreenState extends State<AddTemplatesScreen> {
  late AddTemplateCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<AddTemplateCubit>();
    // cubit.emitGetTemplatesByIdStates(widget.templateId ?? 0);
    if (widget.isEdit) {
      cubit.emitGetTemplatesByIdStates(widget.templateId ?? 0);
    }
    cubit.validateTemplate();
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
                return IconButton(
                    onPressed: addOrUpdateOnPressed(),
                    icon: Icon(
                      Icons.check_circle_rounded,
                      color: cubit.isValid ? Colors.green : Colors.grey,
                      size: 40.r,
                    ));
              },
            )
          ],
          title: AppStrings.manageAudiences.tr(),
        ),
        body: BlocBuilder<AddTemplateCubit, AddTemplateState>(
          buildWhen: (previous, current) =>
              current is GetTemplateByIdLoadingState ||
              current is GetTemplateByIdSuccessState ||
              current is ErrorAddTemplate,
          builder: (context, state) {
            return state.maybeWhen(
              getTemplateByIdLoadingState: () => loadingSpinKit(),
              getTemplateByIdSuccessState: (data) => const AddTemplateBody(),
              orElse: () => const AddTemplateBody(),
            );
            // return const AddTemplateBody();
          },
        ));
  }

  addOrUpdateOnPressed() {
    if (kDebugMode) {
      print('isEdit: ${widget.isEdit} , cubit.isValid: ${cubit.isValid} ');
    }
    return cubit.isValid && !widget.isEdit
        ? () => cubit.emitAddTemplateStates()
        : cubit.isValid && widget.isEdit
            ? () => cubit.emitUpdateTemplateStates(widget.templateId ?? 0)
            : null;
  }
}
