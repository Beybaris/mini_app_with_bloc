import 'dart:convert';

import 'package:innlab_bloc_test_example/pages/gallery/model/Albums.dart';
import 'package:http/http.dart' as http;
class AlbumsProvider {
  Future<List<Albums>> getAlbums() async {

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if(response.statusCode == 200 ){
      final List<dynamic> albumsJson = json.decode(response.body);
      return albumsJson.map((json) => Albums.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching Albums');
    }
  }
}