part of 'manage_audiances_cubit.dart';

@freezed
class ManageAudiancesState with _$ManageAudiancesState {
  const factory ManageAudiancesState.initial() = _Initial;
  const factory ManageAudiancesState.loading() = AudienceLoading;
  const factory ManageAudiancesState.deletion() = AudienceDeletion;
  const factory ManageAudiancesState.loaded(List<Audiences> audiences) =
      AudienceLoaded;
  const factory ManageAudiancesState.error(String message) = AudienceError;
}
