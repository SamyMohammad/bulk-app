part of 'templates_cubit.dart';

@freezed
sealed class TemplatesState with _$TemplatesState {
  const factory TemplatesState.initial() = _Initial;

  const factory TemplatesState.getAllTemplatesLoadingState() = GetAllTemplatesLoadingState;

  const factory TemplatesState.getAllTemplatesSuccessState(TemplatesData data) = GetAllTemplatesSuccessState;
  
  const factory TemplatesState.getAllTemplatesEmptyState(TemplatesData data) = GetAllTemplatesEmptyState;

  const factory TemplatesState.getAllTemplatesErrorState({required ApiErrorModel error}) = GetAllTemplatesErrorState;

    const factory TemplatesState.loadingDelete() = _LoadingDelete;

  const factory TemplatesState.successDelete() = _SuccessDelete;

  const factory TemplatesState.errorDelete({required ApiErrorModel error}) = _ErrorDelete;

}
