part of 'contact_screen_cubit.dart';

abstract class ContactScreenState extends Equatable {
  const ContactScreenState();

  @override
  List<Object> get props => [];
}

class ContactScreenInitial extends ContactScreenState {}

class ContactsLoading extends ContactScreenState {}

class ContactsLoaded extends ContactScreenState {
  final List<Contacts> contacts;

  const ContactsLoaded(this.contacts);

  @override
  List<Object> get props => [contacts];
}

class ContactsError extends ContactScreenState {
  final String message;

  const ContactsError(this.message);

  @override
  List<Object> get props => [message];
}
