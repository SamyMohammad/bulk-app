part of 'account_settings_cubit.dart';

abstract class AccountSettingsState extends Equatable {
  const AccountSettingsState();

  @override
  List<Object> get props => [];
}

class AccountSettingsInitialState extends AccountSettingsState {}

class LanguageSettingState extends AccountSettingsState {
  const LanguageSettingState({required this.language});
  final String language;

  @override
  List<Object> get props => [language];
}

class SignatureSettingState extends AccountSettingsState {
  const SignatureSettingState({required this.signature});
  final bool signature;

  @override
  List<Object> get props => [signature];
}
