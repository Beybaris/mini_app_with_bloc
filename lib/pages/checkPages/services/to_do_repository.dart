import 'package:innlab_bloc_test_example/pages/checkPages/model/todo.dart';
import 'package:innlab_bloc_test_example/pages/checkPages/services/to_do_provider.dart';

class ToDoRepository {
  final ToDoProvider _newsProvider = ToDoProvider();

  Future<List<ToDo>> getAllToDoLists() => _newsProvider.getToDo();
}