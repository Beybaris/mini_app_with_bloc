import 'package:innlab_bloc_test_example/pages/news_pages/model/news_comments.dart';

abstract class CommentsState {}

class CommentsInitialState extends CommentsState {}

class CommentsLoadingState extends CommentsState {}

class CommentsSuccesState extends CommentsState {
  List<NewsComments> comments;

  CommentsSuccesState({required this.comments});
}

class CommentsErrorState extends CommentsState {}



