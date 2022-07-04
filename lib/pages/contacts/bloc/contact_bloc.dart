import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/pages/contacts/bloc/contact_event.dart';
import 'package:innlab_bloc_test_example/pages/contacts/bloc/contact_state.dart';
import 'package:innlab_bloc_test_example/pages/contacts/model/contact.dart';
import 'package:innlab_bloc_test_example/pages/contacts/services/contact_repository.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;
  ContactBloc({required this.contactRepository}) : super(ContactInitialState()) {
    on<ContactLoadEvent>((event, emit) async {
      emit(ContactLoadingState());

      try{
        final List<Contact> contactList = await contactRepository.getAllContacts();
        emit(ContactSuccessState(contact: contactList));
      } catch(_) {
        emit(ContactErrorState());
      }
    });
  }

}