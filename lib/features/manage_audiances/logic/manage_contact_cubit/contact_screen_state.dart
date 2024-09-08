part of 'contact_screen_cubit.dart';

@freezed
class ContactScreenState with _$ContactScreenState {
  const factory ContactScreenState.initial() = ContactScreenInitial;
  const factory ContactScreenState.loading() = ContactsLoading;
  const factory ContactScreenState.contactAdded(List<Contact> contacts) =
      ContactAdded;
  //    add contacts to server
  const factory ContactScreenState.addContactsToServerLoadingState() =
      AddContactsToServerLoadingState;
  const factory ContactScreenState.addContactsToServerSuccessState(
          BaseResponse<AudienceData> audienceData) =
      AddContactsToServerSuccessState;
  const factory ContactScreenState.addContactsToServerErrorsState(
      ApiErrorModel error) = AddContactsToServerErrorsState;
// get contacts from server
  const factory ContactScreenState.getContactsFromServerSuccessState(
      List<Contact> contacts) = GetContactsFromServerSuccessState;
  const factory ContactScreenState.getContactsFromServerErrorsState(
      ApiErrorModel error) = GetContactsFromServerErrorsState;
  const factory ContactScreenState.getContactsFromServerLoadingState() =
      GetContactsFromServerLoadingState;

// update contacts in server
  const factory ContactScreenState.updateContactsInServerLoadingState() =
      UpdateContactsInServerLoadingState;
        const factory ContactScreenState.updateContactsInServerSuccessState() =
      UpdateContactsInServerSuccessState;
        const factory ContactScreenState.updateContactsInServerErrorState(ApiErrorModel error) =
      UpdateContactsInServerErrorState;
  const factory ContactScreenState.error(ApiErrorModel error) = ContactsError;

  const factory ContactScreenState.isValidButtonState(bool isValid) = IsValidButtonState;
  // const factory ContactScreenState.isNotValidButtonState() = IsNotValidButtonState;
}
