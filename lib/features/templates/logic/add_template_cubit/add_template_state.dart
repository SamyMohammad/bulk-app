part of 'add_template_cubit.dart';

@freezed
sealed class AddTemplateState with _$AddTemplateState {
  const factory AddTemplateState.initial() = _InitialAddTemplate;
  const factory AddTemplateState.addTemplateLoadingState() =
      _AddTemplateLoadingState;
  const factory AddTemplateState.addTemplateSuccessState(
      BaseResponse addtemplateResponse) = _AddTemplateSuccessState;

  const factory AddTemplateState.getTemplateByIdLoadingState() =
      GetTemplateByIdLoadingState;

  const factory AddTemplateState.getTemplateByIdSuccessState(
          GetTemplateByIdResponse getTemplateByIdResponse) =  
      GetTemplateByIdSuccessState;
  const factory AddTemplateState.updateTemplateLoadingState() =
      _UpdateTemplateLoadingState;

  const factory AddTemplateState.updateTemplateSuccessState(
      BaseResponse baseResponse) = _UpdateTemplateSuccessState;


  const factory AddTemplateState.error({required List<String> error}) =
      ErrorAddTemplate;
  const factory AddTemplateState.pickedMultiMediaAndFiles(
      {XFile? pickedFile, Uint8List? file}) = _PickedMultiMediaAndFiles;
  factory AddTemplateState.stateOfButton({required bool isValid}) =
      _StateOfButton;
}
