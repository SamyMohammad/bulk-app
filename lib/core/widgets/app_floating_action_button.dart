import 'package:bulk_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton(
      {super.key, required this.path, required this.onPressed});
  final String path;
  final VoidCallback? onPressed;

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
            onPressed!();
          }

          // () {
          //   // Access the cubit instance
          //   final cubit = context.read<ContactScreenCubit>();

          //   // Example action: Show a dialog
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return MessageBody(cubit: cubit); // Pass cubit if needed
          //     },
          //   );
          // },
          ),
    );
  }
}
