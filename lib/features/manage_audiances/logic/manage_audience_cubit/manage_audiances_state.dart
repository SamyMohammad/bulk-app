part of 'manage_audiances_cubit.dart';

@freezed
class ManageAudiancesState<T> with _$ManageAudiancesState<T> {
  const factory ManageAudiancesState.initial() = _Initial;

  const factory ManageAudiancesState.audienceLoadingState() =
      AudienceLoadingState;
  const factory ManageAudiancesState.audienceEmptyState() = AudienceEmptyState;

  const factory ManageAudiancesState.audienceSuccessState(
      List<Audience>? audiences) = AudienceSuccessState<T>;
  const factory ManageAudiancesState.audienceErrorState(
      ApiErrorModel apiErrorModel) = AudienceErrorState;
}
