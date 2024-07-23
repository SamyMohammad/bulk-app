
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';
import 'build_login_container.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 6,
          child: VectorGraphic(
            loader: AssetBytesLoader('assets/images/asset 0.svg'),
          ),
        ),
        BuildLoginContainer()
      ],
    );
  }
}
