part of 'contact_screen_cubit.dart';

@freezed
class ContactScreenState with _$ContactScreenState {
  const factory ContactScreenState.initial() = ContactScreenInitial;
  const factory ContactScreenState.loading() = ContactsLoading;
  const factory ContactScreenState.contactAdded(List<Contact> contacts) =
      ContactAdded;
  const factory ContactScreenState.addContactsToServerLoadingState() =
      AddContactsToServerLoadingState;
  const factory ContactScreenState.addContactsToServerSuccessState(
          BaseResponse<AudienceData> audienceData) =
      AddContactsToServerSuccessState;
  const factory ContactScreenState.addContactsToServerErrorsState(
      ApiErrorModel error) = AddContactsToServerErrorsState;

  const factory ContactScreenState.getContactsFromServerSuccessState(
      List<Contact> contacts) = GetContactsFromServerSuccessState;
  const factory ContactScreenState.getContactsFromServerErrorsState(
      ApiErrorModel error) = GetContactsFromServerErrorsState;
  const factory ContactScreenState.getContactsFromServerLoadingState() =
      GetContactsFromServerLoadingState;


  const factory ContactScreenState.error(ApiErrorModel error) = ContactsError;
}
