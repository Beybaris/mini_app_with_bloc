import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:innlab_bloc_test_example/core/colorStyles_const.dart';
import 'package:innlab_bloc_test_example/pages/contacts/bloc/contact_bloc.dart';
import 'package:innlab_bloc_test_example/pages/contacts/model/contact.dart';
import 'package:http/http.dart' as http;
import 'package:innlab_bloc_test_example/pages/contacts/services/contact_repository.dart';
import '../../../core/textStyles_const.dart';
import '../../gallery/widgets/text_field.dart';
import '../bloc/contact_state.dart';
import 'map.dart';

class ContactDetailPage extends StatefulWidget {
  final Contact contact;

  const ContactDetailPage({Key? key, required this.contact}) : super(key: key);
  @override
  _ContactDetailPageState createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.mainBackgroundColor,
      appBar: appBar(widget.contact.name.toString()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
                children: [
                  Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 70,
                            color: Color(0xff979797),
                          ),
                          Container(
                            child: Text('${widget.contact.name}', style: TextStyles.greyDarkRegularStyle),
                          ),
                          SizedBox(height: 15),
                          Container(
                            child: Text('${widget.contact.username}',
                                style: TextStyles.greyDarkMediumStyle.copyWith(
                                    fontSize: 14)),
                          ),

                          SizedBox(height: 25),
                          textField(widget.contact.email.toString(), 'E-mail'),
                          SizedBox(height: 18),
                          textField(widget.contact.phone.toString(), 'Phone number'),
                          SizedBox(height: 18),
                          textField(widget.contact.website.toString(), 'Website'),
                          SizedBox(height: 18),
                          textField(widget.contact.company!.name.toString(), 'Company'),
                          SizedBox(height: 18),
                          textField(widget.contact.address!.suite.toString(), 'Address'),
                          SizedBox(height: 18),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: ColorStyles.whiteColor.withOpacity(0.33),
                            ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MapScreen(contact: widget.contact,)));
                              },
                              child: Text('Location')),

                        ],
                      )),
                ],
    ),
      ),
    );
    //   body: BlocBuilder(builder: (context,state) {
    //
    //     if(state is ContactInitialState) {
    //       return Text('No data received');
    //     }
    //
    //     if(state is ContactLoadingState) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //
    //     if(state is ContactSuccessState) {
    //       var contact = Contact();
    //       for(var i = 0; i < state.contact.length; i++ ){
    //         if(widget.id == state.contact[i].id)
    //           contact = state.contact[i];
    //       }
    //
    //
    //     }
    //
    //     if(state is ContactErrorState) {
    //       return Text('Error fetching contact detail page');
    //     }
    //
    //     return SizedBox.shrink();
    //
    //   },),
    // );
  }





  AppBar appBar(String title) {
    return AppBar(
      title: Text('${title}', style: TextStyles.greyDarkSemiBoldStyle.copyWith(fontSize: 20,)),
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
    );
  }
}
