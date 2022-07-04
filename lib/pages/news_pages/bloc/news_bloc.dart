import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/news_event.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/news_state.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/services/news_posts_repository.dart';

import '../model/news_posts.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsPostsRepository newsPostsRepository;
  NewsBloc({required this.newsPostsRepository}) : super(NewsInitialState()) {
    on<NewsPostsEvent>((event, emit) async {
      emit(NewsLoadingState());

      try{
       final List<NewsPosts> newsPostsList = await newsPostsRepository.getAllPosts();
       emit(NewsSuccessState(newsPosts: newsPostsList));
      } catch(_) {
        emit(NewsErrorState());
      }
    });
  }

}