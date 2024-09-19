import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/features/auth/ui/widgets/register_widgets/register_bloc_listener.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_audience_cubit/manage_audiances_cubit.dart';
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 10.w),
          child: Row(
            children: [
              IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.loginScreen),
                icon: Icon(Icons.arrow_back_ios,
                    size: 25.sp, color: Colors.white),
              )
            ],
          ),
        ),

        // Spacer(
        //   flex: 4,
        // ),

        const VectorGraphic(
          loader: AssetBytesLoader('assets/icons/asset 0.svg'),
        ),
        const BuildRegisterContainer(),
        const RegisterBlocListener(),
      ],
    );
  }
}
