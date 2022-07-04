import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/bloc/to_do_bloc.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/bloc/to_do_event.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/services/to_do_repository.dart';

import '../../../core/colorStyles_const.dart';
import 'check_list.dart';
class CheckPage extends StatelessWidget {
  final toDoRepository = ToDoRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ToDoBloc(toDoRepository: toDoRepository)..add(ToDoLoadEvent()),
    child: Scaffold(
      backgroundColor: ColorStyles.mainBackgroundColor,
      appBar: AppBar(
        title: Text('Check', style: TextStyles.greyDarkSemiBoldStyle.copyWith(fontSize: 20,)),
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
      body: CheckList(),
    ), );

  }
}
