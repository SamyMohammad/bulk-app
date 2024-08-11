import 'dart:async';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:bulk_app/features/auth/data/models/login_request_body.dart';
import 'package:bulk_app/features/auth/logic/login_cubit/login_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // Future<void> fetchData(SendPort sendPort) async {
  //   // Simulate a network request or heavy computation
  //   final result = _loginRepo.login(
  //     LoginRequestBody(
  //       email: emailController.text,
  //       password: passwordController.text,
  //       spamCheck: '',
  //     ),
  //   );
  //   return sendPort.send(result);
  // }

  // Future<ApiResult<LoginResponse>> runIsolate() async {
  //   // return await compute(fetchData, '');
  //   final ReceivePort receivePort = ReceivePort();
  //   await Isolate.spawn(fetchData, receivePort.sendPort);
  //   return await receivePort.first;
  // }

  void emitLoginStates() async {
    emit(const LoginState.loginLoadingState());
    final response = await _loginRepo
        .login(LoginRequestBody(
          email: emailController.text,
          type: 'user',
          password: passwordController.text,
          spamCheck: '',
        ));
      
    if (kDebugMode) {
      print('response----------$response');
    }
    response.when(success: (loginResponse) async {
      await saveUserToken(loginResponse.data?.user?.token ?? '');
      emit(LoginState.loginSuccessState(loginResponse));
    }, failure: (error) {
      emit( LoginState.loginErrorState(error));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
