import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_settings_state.dart';

class AccountSettingsCubit extends Cubit<AccountSettingsState> {
  AccountSettingsCubit() : super(AccountSettingsInitialState()) {
    init();
  }
  late bool signature;
  late String language;
  final List<String> languages = ['En', 'Ar'];

  void init() {
    signature = false;
    language = "En";
  }

  void switchSignature() {
    signature = !signature;
    emit(SignatureSettingState(signature: signature));
  }

  void updateLanguage(String newLanguage) {
    language = newLanguage;
    emit(LanguageSettingState(language: language));
  }
}
