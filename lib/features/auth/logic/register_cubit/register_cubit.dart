import 'package:bloc/bloc.dart';
import 'package:bulk_app/features/auth/data/models/login_request_body.dart';
import 'package:bulk_app/features/auth/data/repos/auth_repo.dart';
import 'package:bulk_app/features/auth/logic/register_cubit/register_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class RegisterCubit extends Cubit<RegisterState> {
    final AuthRepo _authRepo;

  RegisterCubit(this._authRepo) : super(const RegisterState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
    void emitRegisterStates() async {
    emit(const RegisterState.registerLoadingState());
    final response = await _authRepo
        .register(LoginAndRegisterRequestBody(
          email: emailController.text,
          // type: 'user',
          password: passwordController.text,
          spamCheck: '',
        ));
    if (kDebugMode) {
      print('response----------$response');
    }
    response.when(success: (loginResponse) async {
      emit(RegisterState.registerSuccussState(loginResponse));
    }, failure: (error) {
      emit( RegisterState.registerErrorState(error: error));
    });
  }
}
