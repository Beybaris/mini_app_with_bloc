import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/bloc/to_do_event.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/bloc/to_do_state.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/model/todo.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/services/to_do_repository.dart';

class ToDoBloc extends Bloc<TodoEvent, ToDoState> {

  final ToDoRepository toDoRepository;

  ToDoBloc({required this.toDoRepository}) : super(ToDoInitialState()) {
    on<ToDoLoadEvent>((event, emit) async {
      emit(ToDoLoadingState());

      try {
        final List<ToDo> toDoList = await toDoRepository.getAllToDoLists();
        emit(ToDoSuccessState(toDoLst: toDoList));
      } catch(_) {
        emit(ToDoErrorState());
      }
    });
  }

}