import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/colorStyles_const.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/news_bloc.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/services/news_posts_repository.dart';
import '../widgets/news_posts.dart';

class NewsPage extends StatefulWidget {

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final newsPostsRepository = NewsPostsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => NewsBloc(newsPostsRepository: newsPostsRepository),

    child: Scaffold(

      backgroundColor: ColorStyles.mainBackgroundColor,
      appBar: AppBar(
        title: Text('News', style: TextStyles.greyDarkSemiBoldStyle.copyWith(fontSize: 20,)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0,1),
                blurRadius: 12,
                spreadRadius: 0,
              ),
              BoxShadow(
                offset: Offset(0,4),
                blurRadius: 8,
                spreadRadius: 0,
              ),
              BoxShadow(
                offset: Offset(0,1),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Color(0xff322C54),
                Color(0xff231D49)
              ],
            ),
          ),
        ),
      ),
      body: NewPosts(),
    ),
    );

  }
}
