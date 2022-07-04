import 'package:innlab_bloc_test_example/pages/news_pages/model/news_comments.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/model/news_posts.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/services/news_api_provider.dart';

class NewsPostsRepository {
  final NewsProvider _newsProvider = NewsProvider();

  Future<List<NewsPosts>> getAllPosts() => _newsProvider.getNewsPosts();

  Future<List<NewsComments>> getAllComments() => _newsProvider.getNewComments();
}