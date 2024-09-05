import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  
  const factory LoginState.loginLoadingState() = LoginLoadingState;
  const factory LoginState.loginSuccessState(T data) = LoginSuccessState<T>;
  const factory LoginState.loginErrorState(ApiErrorModel apiErrorModel) = LoginErrorState;
} 