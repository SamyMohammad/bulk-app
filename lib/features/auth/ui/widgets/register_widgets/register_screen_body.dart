import 'package:bulk_app/features/auth/ui/widgets/register_widgets/register_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

import 'build_register_container.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Spacer(
        //   flex: 4,
        // ),
        25.verticalSpace,
        const VectorGraphic(
          loader: AssetBytesLoader('assets/images/asset 0.svg'),
        ),
        const BuildRegisterContainer(),
        const RegisterBlocListener(),
      ],
    );
  }
}
