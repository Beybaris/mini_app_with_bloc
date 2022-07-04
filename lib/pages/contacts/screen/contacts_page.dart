import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/pages/contacts/bloc/contact_bloc.dart';
import 'package:innlab_bloc_test_example/pages/contacts/bloc/contact_event.dart';
import 'package:innlab_bloc_test_example/pages/contacts/services/contact_repository.dart';
import 'package:innlab_bloc_test_example/pages/contacts/widgets/contact_list.dart';

import '../../../core/colorStyles_const.dart';
import '../../../core/textStyles_const.dart';

class ContastsPage extends StatelessWidget {
  final contactRepository = ContactRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ContactBloc(contactRepository: contactRepository)..add(ContactLoadEvent()),
    child: Scaffold(
        backgroundColor: ColorStyles.mainBackgroundColor,
        appBar: AppBar(
          title: Text('Contacts', style: TextStyles.greyDarkSemiBoldStyle.copyWith(fontSize: 20,)),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,1),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  offset: Offset(0,1),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Color(0xff322C54),
                  Color(0xff231D49)
                ],
              ),
            ),
          ),
        ),
        body: ContactList(),

    ),
    );

  }
}
