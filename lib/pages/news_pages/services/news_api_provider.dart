import 'package:innlab_bloc_test_example/pages/news_pages/model/news_comments.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/model/news_posts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsProvider {
  Future<List<NewsPosts>> getNewsPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if(response.statusCode == 200) {
      final List<dynamic> newsJson = json.decode(response.body);
      return newsJson.map((json) => NewsPosts.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching NEWS POSTS');
    }
}

  Future<List<NewsComments>> getNewComments() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if(response.statusCode == 200) {
      final List<dynamic> commentsJson = json.decode(response.body);
      return commentsJson.map((json) => NewsComments.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching News Comments');
    }
  }
}