import 'package:innlab_bloc_test_example/pages/contacts/model/contact.dart';

abstract class ContactState{}

class ContactInitialState extends ContactState{}

class ContactLoadingState extends ContactState{}

class ContactSuccessState extends ContactState{
  List<Contact> contact;

  ContactSuccessState({required this.contact});
}

class ContactErrorState extends ContactState {

}