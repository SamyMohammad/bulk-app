import 'package:flutter/foundation.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

abstract class ContactsService {
  Future<List<Contact>?> getContacts();
}

class ContactsServiceImpl implements ContactsService {
  // final FlutterContactPickerPlus _contactPicker;

  ContactsServiceImpl();

  @override
  Future<List<Contact>?> getContacts() async {
    try {
      if (await FlutterContacts.requestPermission()) {
        final contacts =
            await FlutterContacts.getContacts(withProperties: true);
        return contacts;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
}
