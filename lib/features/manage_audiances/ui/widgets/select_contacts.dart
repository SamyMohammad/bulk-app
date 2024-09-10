import 'package:bulk_app/core/widgets/loading_widget.dart';
import 'package:bulk_app/features/manage_audiances/data/models/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as flutter_contacts;

class DeviceMultiContactSelection extends StatefulWidget {
  const DeviceMultiContactSelection({super.key});

  @override
  DeviceMultiContactSelectionState createState() =>
      DeviceMultiContactSelectionState();
}

class DeviceMultiContactSelectionState
    extends State<DeviceMultiContactSelection> {
  List<flutter_contacts.Contact> _contacts = [];
  List<flutter_contacts.Contact> _selectedContacts = [];
  bool? isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final contactsFromNavigation =
        ModalRoute.of(context)!.settings.arguments as List<Contact>?;
    _selectedContacts = contactsFromNavigation
            ?.map((e) => flutter_contacts.Contact(displayName: e.name!))
            .toList() ??
        [];
    // _selectedContacts = _contacts;
  }

  Future<void> _loadContacts() async {
    if (await flutter_contacts.FlutterContacts.requestPermission()) {
      final contacts = await flutter_contacts.FlutterContacts.getContacts(withProperties: true);
      isLoading = false;
      print('contactssss${contacts.length}');
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Select Contacts'),
      ),
      body: isLoading == true
          ? const LoadingWidget()
          : ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                return CheckboxListTile(
                  title: Text(contact.displayName),
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  subtitle: Text(contact.phones.isNotEmpty
                      ? contact.phones.first.number
                      : ''),
                  value: _selectedContacts.contains(contact),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedContacts.add(contact);
                      } else {
                        _selectedContacts.remove(contact);
                      }
                    });
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).pop(_selectedContacts);
          print(
              'Selected contacts: ${_selectedContacts.map((c) => c.displayName).toList()}');
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
