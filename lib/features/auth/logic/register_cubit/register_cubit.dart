import 'package:bloc/bloc.dart';
import 'package:bulk_app/features/auth/logic/register_cubit/register_state.dart';
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState.initial());
}
