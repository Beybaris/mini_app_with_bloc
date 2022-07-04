import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';
import 'package:innlab_bloc_test_example/pages/contacts/bloc/contact_bloc.dart';
import 'package:innlab_bloc_test_example/pages/contacts/bloc/contact_state.dart';
import 'package:innlab_bloc_test_example/pages/contacts/screen/contacts_detail.dart';
class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactBloc, ContactState>(
        listener: (context, state) {
          log(state.toString());
          if(state is ContactLoadingState) {
            ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text('Contact is Loaded')));
          }
        },
        builder: (context, state) {
          if(state is ContactInitialState) {
            return Text('No date received', style: TextStyles.greyDarkRegularStyle);
          }

          if(state is ContactLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if(state is ContactSuccessState) {
            return ListView.builder(
                itemCount: state.contact.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactDetailPage(contact: state.contact[index],)));
                    },
                    child: Container(
                      // padding: EdgeInsets.all(16),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.account_circle, size: 40, color: Color(0xff979797),),
                            SizedBox(width: 28),
                            Text('${state.contact[index].name}', style: TextStyles.greyDarkRegularStyle),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }

          if(state is ContactErrorState) {
            return Text('Error fetching Contact List ', style: TextStyles.greyDarkBoldStyle);
          }

          return SizedBox.shrink();
        });




  }
}
