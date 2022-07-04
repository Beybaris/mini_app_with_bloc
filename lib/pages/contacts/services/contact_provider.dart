import 'package:innlab_bloc_test_example/pages/contacts/model/contact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactProvider {
  Future<List<Contact>> getContact() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200) {
      final List<dynamic> newsJson = json.decode(response.body);
      return newsJson.map((json) => Contact.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching NEWS POSTS');
    }
  }
}