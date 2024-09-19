part of 'start_campagin_cubit.dart';

@freezed
class StartCampaginState with _$StartCampaginState {
  const factory StartCampaginState.initial() = _Initial;
      const factory StartCampaginState.pickedMultiMediaAndFiles(
      {XFile? pickedFile}) = _PickedMultiMediaAndFiles;
  factory StartCampaginState.stateOfButton({required bool isValid}) =
      _StateOfButton;
}
