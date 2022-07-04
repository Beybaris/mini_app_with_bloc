import 'package:innlab_bloc_test_example/pages/gallery/model/gallery.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryProvider {
  Future<List<Gallery>> getGallery() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if(response.statusCode == 200) {
      final List<dynamic> galleryJson = json.decode(response.body);
      return galleryJson.map((json) => Gallery.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching Gallery');
    }
  }
}