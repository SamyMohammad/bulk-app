import 'package:flutter/material.dart';
import '../widgets/register_widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: RegisterScreenBody()),
    );
  }
}
