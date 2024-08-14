// manage_audiances_cubit.dart
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_audience_state.freezed.dart';

@freezed
class ManageAudiancesState<T> with _$ManageAudiancesState<T> {
  const factory ManageAudiancesState.initial() = _Initial;

  const factory ManageAudiancesState.audienceLoadingState() =
      AudienceLoadingState;
  const factory ManageAudiancesState.audienceEmptyState() = AudienceEmptyState;

  const factory ManageAudiancesState.audienceSuccessState(List<Audiences>? audiences) =
      AudienceSuccessState<T>;
  const factory ManageAudiancesState.audienceErrorState(
      ApiErrorModel apiErrorModel) = AudienceErrorState;
}
