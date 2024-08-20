import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/message_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class AddContactsButton extends StatelessWidget {
  const AddContactsButton({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.containerTitleColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: IconButton(
        icon: VectorGraphic(
          width: 40.r,
          height: 40.r,
          loader: AssetBytesLoader(
            path,
          ),
        ),
        color: ColorsManager.darkBackGround,
        onPressed: () {
          // Access the cubit instance
          final cubit = context.read<ContactScreenCubit>();

          // Example action: Show a dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MessageBody(cubit: cubit); // Pass cubit if needed
            },
          );
        },
      ),
    );
  }
}
