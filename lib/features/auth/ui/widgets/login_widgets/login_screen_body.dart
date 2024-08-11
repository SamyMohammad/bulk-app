import 'package:bulk_app/features/auth/ui/widgets/login_widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

import 'build_login_container.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        20.verticalSpace,
        const VectorGraphic(
          loader: AssetBytesLoader('assets/images/asset 0.svg'),
        ),
        const BuildLoginContainer(),
        const LoginBlocListener(),
      ],
    );
  }
}
