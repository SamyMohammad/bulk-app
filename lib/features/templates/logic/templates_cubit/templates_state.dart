part of 'templates_cubit.dart';

@freezed
class TemplatesState with _$TemplatesState {
  const factory TemplatesState.initial() = _Initial;

  const factory TemplatesState.loading() = _Loading;

  const factory TemplatesState.success(TemplatesData data) = _Success;
  const factory TemplatesState.empty(TemplatesData data) = _Empty;

  const factory TemplatesState.error({required List<String> error}) = _Error;
}
