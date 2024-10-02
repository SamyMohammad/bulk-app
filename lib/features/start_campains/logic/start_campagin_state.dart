part of 'start_campagin_cubit.dart';

@freezed
class StartCampaginState with _$StartCampaginState {
  const factory StartCampaginState.initial() = _Initial;
  const factory StartCampaginState.selectedTemplate() = SelectedTemplate;

  const factory StartCampaginState.pickedMultiMediaAndFiles(
      {XFile? pickedFile}) = _PickedMultiMediaAndFiles;
  factory StartCampaginState.stateOfButton({required bool isValid}) =
      _StateOfButton;
  factory StartCampaginState.selectedAudience() = SelectedAudience;
  factory StartCampaginState.getTemplateByIdSuccessState() =
      GetTemplateByIdSuccessState;

  factory StartCampaginState.createCampaignSuccessState() =
      CreateCampaignSuccessState;
  factory StartCampaginState.createCampaignLoadingState() =
      CreateCampaignLoadingState;
  factory StartCampaginState.createCampaignFailureState(
      ApiErrorModel apiErrorModel) = CreateCampaignFailureState;
}
