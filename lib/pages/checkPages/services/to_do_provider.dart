import 'package:innlab_bloc_test_example/pages/checkPages/model/todo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ToDoProvider {
  Future<List<ToDo>> getToDo() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if(response.statusCode == 200) {
      final List<dynamic> toDoJson = json.decode(response.body);
      return toDoJson.map((json) => ToDo.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching Gallery');
    }
  }
}