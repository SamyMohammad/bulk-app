import 'package:bloc/bloc.dart';
import 'package:bulk_app/features/auth/logic/login_cubit/login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());
}
