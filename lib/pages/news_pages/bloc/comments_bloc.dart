import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/comments_event.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/comments_state.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/model/news_comments.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/services/news_posts_repository.dart';

import '../services/news_api_provider.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final NewsPostsRepository commentsRepository;

  CommentsBloc({required this.commentsRepository}) : super(CommentsInitialState()) {
    on<CommentsLoadEvent>((event, emit) async {
      emit(CommentsLoadingState());

      try {
        final List<NewsComments> commentsList = await commentsRepository.getAllComments();
        emit(CommentsSuccesState(comments: commentsList));
      } catch(_) {
        emit(CommentsErrorState());
      }
    });
  }


}