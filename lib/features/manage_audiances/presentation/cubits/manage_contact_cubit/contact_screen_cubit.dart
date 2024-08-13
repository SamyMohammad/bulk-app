import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/networking/api_service.dart';
import 'package:bulk_app/features/manage_audiances/models/audiences.dart';
import 'package:bulk_app/features/manage_audiances/models/contacts.dart';
import 'package:bulk_app/features/manage_audiances/repository/audiance_repository.dart';
import 'package:equatable/equatable.dart';

part 'contact_screen_state.dart';

class ContactScreenCubit extends Cubit<ContactScreenState> {
  ContactScreenCubit() : super(ContactScreenInitial());
  late final List<Contacts> contacts;
  late final AudienceRepository repository;
  // late final int audienceId;

  void init(List<Contacts> currentcontacts) {
    emit(ContactsLoading());
    contacts = currentcontacts;
    // audienceId = id;
    final ApiService client = getIt<ApiService>();
    repository = AudienceRepository(client);
    emit(ContactsLoaded(contacts));
  }

  // Future<void> deleteContact(String phone, Audiences audience) async {
  //   emit(ContactsLoading());

  //   // Remove the contact from the audience's contacts list
  //   contacts.removeWhere((contact) => contact.phone == phone);
  //   audience.contacts = contacts;

  //   try {
  //     // Assuming you pass the audience id directly or update the audience instance
  //     await repository.updateAudience(audienceId, audience);

  //     // Emit the updated state
  //     emit(ContactsLoaded(contacts));
  //   } catch (e) {
  //     emit(const ContactsError('Failed to update audience.'));
  //   }
  // }
}
