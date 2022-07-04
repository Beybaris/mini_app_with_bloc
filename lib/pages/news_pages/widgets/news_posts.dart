import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/news_event.dart';

import '../../../core/textStyles_const.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_state.dart';
import '../screens/comments_page.dart';
import 'news_container.dart';
class NewPosts extends StatefulWidget {
  const NewPosts({Key? key}) : super(key: key);

  @override
  State<NewPosts> createState() => _NewPostsState();
}

class _NewPostsState extends State<NewPosts> {
  @override
  Widget build(BuildContext context) {
    final NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);
    return BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          log(state.toString());
          if (state is NewsSuccessState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Posts is Loaded')));
          }
        },
        builder: (context, state) {
          if(state is NewsInitialState){
            newsBloc.add(NewsPostsEvent());
            return Text('No data received',style: TextStyle(color: Colors.white));

          }

          if(state is NewsLoadingState) {
            return Center(child: CircularProgressIndicator(color: Colors.white,));
          }

          if(state is NewsSuccessState) {
            return ListView.builder(
                itemCount: state.newsPosts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CommentsPage(
                              description: state.newsPosts[index].body.toString(),
                              title: state.newsPosts[index].title.toString(),
                              id: state.newsPosts[index].id!,
                            ))
                        );
                      },
                      child: NewsContainer(
                        title: state.newsPosts[index].title.toString(),
                        description: state.newsPosts[index].body.toString(),
                      )
                  );
                });
          }

          if(state is NewsErrorState) {
            return Text('Error News Posts ', style: TextStyles.greyDarkBoldStyle.copyWith(color: Colors.red));
          }

          return SizedBox.shrink();
        },
      );


  }
}
