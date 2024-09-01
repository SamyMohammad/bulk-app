import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/core/networking/api_service.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiences.dart';
import 'package:bulk_app/features/manage_audiances/data/models/contacts.dart';
import 'package:bulk_app/features/manage_audiances/data/repository/audiance_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_screen_cubit.freezed.dart';
part 'contact_screen_state.dart';

class ContactScreenCubit extends Cubit<ContactScreenState> {
  late final AudienceRepository _audienceRepository;

  ContactScreenCubit(this._audienceRepository)
      : super(const ContactScreenState.initial());

  List<Contacts>? currentAudienceContacts;
  Audiences? currentAudience;

  void init(Audiences audience) {
    emit(const ContactScreenState.loading());
    currentAudience = audience;
    currentAudienceContacts = audience.contacts;
    emit(ContactScreenState.loaded(currentAudienceContacts ?? []));
    final ApiService client = getIt<ApiService>();
    _audienceRepository = AudienceRepository(client);
  }

  void removeContact(Contacts contact) {
    if (currentAudienceContacts != null) {
      final updatedContacts = List<Contacts>.from(currentAudienceContacts!)
        ..remove(contact);
      currentAudienceContacts = updatedContacts;
      currentAudience?.contacts = currentAudienceContacts;
      emit(ContactScreenState.loaded(updatedContacts));
      _audienceRepository.updateAudience(currentAudience!);
    }
  }

  // void addContact(String contactName, String contactNumber) {
  //   emit(const ContactScreenState.loading());
  //   Contacts newContact = Contacts(name: contactName, phone: contactNumber);
  //   currentAudienceContacts?.add(newContact);
  //   currentAudience?.contacts = currentAudienceContacts;
  //   emit(ContactScreenState.loaded(currentAudienceContacts!));
  //   repository.updateAudience(currentAudience!);
  // }

  void emitAddContactStates({
    required String contactName,
    required String contactNumber,
  }) async {
    emit(const ContactScreenState.loading());
    Contacts newContact = Contacts(
        name: contactName, phone: contactNumber, id: currentAudience?.id);
    currentAudienceContacts?.add(newContact);
    // currentAudience?.contacts = currentAudienceContacts;
    final response = await _audienceRepository.updateAudience(Audiences(
      contacts: currentAudienceContacts,
    ));
    if (kDebugMode) {
      // print('response----------$response');
    }
    response.when(success: (loginResponse) async {
      emit(ContactScreenState.loaded(loginResponse));
    }, failure: (error) {
      emit(ContactScreenState.error(error));
    });
  }
}
