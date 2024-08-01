part of 'add_template_cubit.dart';

@freezed
sealed class AddTemplateState with _$AddTemplateState {
  const factory AddTemplateState.initial() = _InitialAddTemplate;
  const factory AddTemplateState.loading() = _LoadingAddTemplate;
  const factory AddTemplateState.success(BaseResponse addtemplateResponse) = _SuccessAddTemplate;
    const factory AddTemplateState.getTemplateByIdSuccess(GetTemplateByIdResponse getTemplateByIdResponse) = _GetTemplateByIdSuccess;

  const factory AddTemplateState.error({required List<String> error}) =
      _ErrorAddTemplate;
  const factory AddTemplateState.pickedMultiMediaAndFiles(
      { XFile? pickedFile,  Uint8List? file}) = _PickedMultiMediaAndFiles;
  factory AddTemplateState.stateOfButton({required bool isValid}) =_StateOfButton;
}
