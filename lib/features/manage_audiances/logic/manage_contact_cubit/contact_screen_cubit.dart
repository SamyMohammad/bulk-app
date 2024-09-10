import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/helpers/contacts_service.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiance_response_data.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audience.dart';
import 'package:bulk_app/features/manage_audiances/data/models/contacts.dart';
import 'package:bulk_app/features/manage_audiances/data/repository/audiance_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/base_response.dart';

part 'contact_screen_cubit.freezed.dart';
part 'contact_screen_state.dart';

class ContactScreenCubit extends Cubit<ContactScreenState> {
  late final AudienceRepository _audienceRepository;

  ContactScreenCubit(this._audienceRepository, this._contactsService)
      : super(const ContactScreenState.initial());

  List<Contact>? currentAudienceContacts;
  Audience? currentAudience;
  final audienceNameController = RestorableTextEditingController();
  final contactNameController = TextEditingController();
  final contactNumberController = TextEditingController();
  bool isValid = false;
  changeValidButton() {
    if (audienceNameController.value.text.isNotEmpty) {
      isValid = true;
    } else {
      isValid = false;
    }
    emit(ContactScreenState.isValidButtonState(isValid));
  }
// get audience by id

  void emitGetAudienceByIdStates(String id) async {
    emit(const ContactScreenState.getContactsFromServerLoadingState());

    final response = await _audienceRepository.getAudienceById(id);
    if (kDebugMode) {
      print(response);
    }
    response.when(success: (response) async {
      currentAudience = response.data?.audience;
      currentAudienceContacts = currentAudience?.contacts;
      emit(ContactScreenState.getContactsFromServerSuccessState(
          currentAudienceContacts ?? []));
    }, failure: (error) {
      emit(ContactScreenState.getContactsFromServerErrorsState(error));
    });
  }

  void removeContact(Contact contact) {
    if (currentAudienceContacts != null) {
      final updatedContacts = List<Contact>.from(currentAudienceContacts!)
        ..remove(contact);
      currentAudienceContacts = updatedContacts;
      currentAudience?.contacts = currentAudienceContacts;
      emit(ContactScreenState.contactAdded(currentAudienceContacts ?? []));
      // emit(ContactScreenState.loaded(updatedContacts));
      // _audienceRepository.updateAudience(currentAudience!);
    }
  }

  void addContact(Contact contact) {
    Contact newContact = Contact(name: contact.name, phone: contact.phone);
    currentAudienceContacts = [...?currentAudienceContacts, newContact];
    currentAudience?.contacts = currentAudienceContacts;

    emit(ContactScreenState.contactAdded(currentAudienceContacts ?? []));
  }

  void addContactsList(List<Contact> contacts) {
    // Contact newContact = Contact(name: contact.name, phone: contact.phone);
    // List<String> currentAudienceContactsNames =
    //     currentAudienceContacts!.map((e) => e.name!).toList();
    currentAudienceContacts = [
      ...currentAudienceContacts ?? [],
      ...contacts.where((item) => !currentAudienceContacts!
          .map((e) => e.name)
          .toList()
          .contains(item.name))
    ];

    currentAudience?.contacts = currentAudienceContacts;

    emit(ContactScreenState.contactAdded(currentAudienceContacts ?? []));
  }

  void emitAddContactsToServerStates() async {
    emit(const ContactScreenState.addContactsToServerLoadingState());
    final response = await _audienceRepository.addNewAudience(Audience(
        contacts: currentAudienceContacts,
        name: audienceNameController.value.text));
    if (kDebugMode) {
      print(response);
    }
    response.when(success: (response) async {
      emit(ContactScreenState.addContactsToServerSuccessState(response));
    }, failure: (error) {
      emit(ContactScreenState.addContactsToServerErrorsState(error));
    });
  }

  void emitUpdateContactsToServerStates() async {
    emit(const ContactScreenState.updateContactsInServerLoadingState());
    final response = await _audienceRepository.updateAudience(Audience(
      id: currentAudience?.id,
      name: audienceNameController.value.text,
      contacts: currentAudienceContacts,
    ));
    if (kDebugMode) {
      print(response);
    }
    response.when(success: (response) async {
      emit(const ContactScreenState.updateContactsInServerSuccessState());
    }, failure: (error) {
      emit(ContactScreenState.updateContactsInServerErrorState(error));
    });
  }

  final ContactsService _contactsService;

  Future<void> syncContacts() async {
    // emit(
    //   ContactsLoading(
    //     contacts: state.contacts,
    //   ),
    // );
    final contacts = await _contactsService.getContacts();
    print('contactscontacts${contacts?.length}');
    if (contacts != null) {
      if (contacts.isNotEmpty) {
        print(contacts);
        // emit(ContactsSuccess(contacts: contacts));
      } else {
        // emit(
        // ContactsFailure(
        //   contacts: state.contacts,
        //   errorMessage: 'No contacts were found on the device',
        // ),
        // );
      }
    } else {
      // emit(
      //   ContactsFailure(
      //     contacts: state.contacts,
      //     errorMessage: 'Unable to fetch contacts',
      //   ),
      // );
    }
  }
}
