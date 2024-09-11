part of 'whatsbots_cubit.dart';

@freezed
sealed  class WhatsbotsState with _$WhatsbotsState {
  const factory WhatsbotsState.initial() = _Initial;
}
