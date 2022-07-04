import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/bloc/to_do_bloc.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/bloc/to_do_state.dart';

import '../../../core/colorStyles_const.dart';

class CheckList extends StatefulWidget {
  const CheckList({Key? key}) : super(key: key);

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoBloc, ToDoState>(
        listener: (context, state) {
          log(state.toString());
          if(state is ToDoLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('ToDo is Loaded'),)
            );
          }
        },
        builder: (context, state) {
          if(state is ToDoInitialState) {
            return Text('No data received', style: TextStyles.greyDarkRegularStyle);
          }

          if(state is ToDoLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if(state is ToDoSuccessState) {
            return ListView.builder(
                itemCount: state.toDoLst.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    side: BorderSide(color: Color(0xffDADADA),),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: state.toDoLst[index].completed,
                    checkColor: ColorStyles.checkBoxColor,
                    onChanged: (bool? value) {
                      setState(() {
                        state.toDoLst[index].completed = !state.toDoLst[index].completed!;
                      });
                    },
                    title: Text('${state.toDoLst[index].title}', style: TextStyles.greyDarkRegularStyle),

                  );
                });
          }

          if(state is ToDoErrorState) {
            return Text('Error fetching ToDoList');
          }

          return SizedBox.shrink();
        });
  }
}

