import '../model/todo.dart';

abstract class ToDoState {}

class ToDoInitialState extends ToDoState{}

class ToDoLoadingState extends ToDoState {}

class ToDoSuccessState extends ToDoState {
  List<ToDo> toDoLst;
  ToDoSuccessState({required this.toDoLst});
}

class ToDoErrorState extends ToDoState {}