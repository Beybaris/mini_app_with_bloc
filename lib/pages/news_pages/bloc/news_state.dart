import 'package:innlab_bloc_test_example/pages/news_pages/model/news_posts.dart';

abstract class NewsState{}

class NewsInitialState extends NewsState{}

class NewsLoadingState extends NewsState{}

class NewsSuccessState extends NewsState{
  List<NewsPosts> newsPosts;

  NewsSuccessState({required this.newsPosts});
}

class NewsErrorState extends NewsState {

}