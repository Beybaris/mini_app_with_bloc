import 'package:innlab_bloc_test_example/pages/contacts/model/contact.dart';
import 'contact_provider.dart';

class ContactRepository {
  final ContactProvider _contactProvider = ContactProvider();

  Future<List<Contact>> getAllContacts() => _contactProvider.getContact();
}