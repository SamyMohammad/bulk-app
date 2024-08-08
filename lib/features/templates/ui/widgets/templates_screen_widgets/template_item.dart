import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/templates/data/models/get_all_templates_response.dart';
import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
import 'package:bulk_app/features/templates/logic/templates_cubit/templates_cubit.dart';
import 'package:bulk_app/features/templates/ui/pages/add_template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemplateItem extends StatelessWidget {
  final Templates template;
  const TemplateItem({super.key, required this.template});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      alignment: Alignment.center,
      height: context.height * 0.11,
      decoration: BoxDecoration(
          color: ColorsManager.darkAppBarBackGround,
          borderRadius: const BorderRadius.all(
            Radius.circular(21),
          ),
          border: Border.all(color: ColorsManager.saerchTextFieldHintColor)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  template.name ?? '',
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyles.font15whiteMedium.copyWith(fontSize: 18.sp),
                ),
                1.sizedBoxHeight,
                Text(
                  '26/07/2023',
                  style: TextStyle(
                      color: ColorsManager.saerchTextFieldHintColor,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () => context
                  .read<TemplatesCubit>()
                  .emitDeleteTemplateStates(template.id ?? 0),
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 43.r,
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            height: double.maxFinite,
            width: 1.w,
            color: ColorsManager.saerchTextFieldHintColor,
          ),
          5.sizedWidth,
          IconButton(
            onPressed: () => editButtonOnPressed(context),
            icon: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.containerTitleColor),
              child: Padding(
                padding: EdgeInsets.all(5.r),
                child: Icon(
                  Icons.edit,
                  fill: 1,
                  // color: ColorsManager.containerTitleColor,
                  // color: Colors.red,
                  size: 24.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  editButtonOnPressed(BuildContext context) {
     Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => getIt<AddTemplateCubit>()..emitGetTemplatesByIdStates( template.id!),
                child: AddTemplatesScreen(
                  isEdit: true,
                  templateId: template.id,
                ),
              ),
            ),
          );
  }
}

class AddTemplateArgs {
  final int? id;
  final bool isEdit;
  AddTemplateArgs({this.id, this.isEdit = true});
}
