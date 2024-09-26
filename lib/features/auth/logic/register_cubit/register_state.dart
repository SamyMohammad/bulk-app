import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState.initial() = _Initial;

  const factory RegisterState.registerLoadingState() = RegisterLoadingState;
  const factory RegisterState.registerSuccussState(T data) =
      RegisterSuccussState<T>;
  const factory RegisterState.registerErrorState(
      {required ApiErrorModel error}) = RegisterErrorState;
}
