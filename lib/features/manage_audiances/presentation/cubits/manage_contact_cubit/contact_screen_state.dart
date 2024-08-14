part of 'contact_screen_cubit.dart';

@freezed
class ContactScreenState with _$ContactScreenState {
  const factory ContactScreenState.initial() = ContactScreenInitial;
  const factory ContactScreenState.loading() = ContactsLoading;
  const factory ContactScreenState.loaded(List<Contacts> contacts) =
      ContactsLoaded;
  const factory ContactScreenState.error(String message) = ContactsError;
}
