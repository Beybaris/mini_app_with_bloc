import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/colorStyles_const.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/comments_bloc.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/comments_event.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/services/news_posts_repository.dart';
import '../../../core/textStyles_const.dart';
import '../bloc/comments_state.dart';
import '../widgets/comment_user.dart';

class TotalCommentsPage extends StatelessWidget {

  final int id;
  final commentRepository = NewsPostsRepository();

  TotalCommentsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) =>
    CommentsBloc(commentsRepository: commentRepository)
      ..add(CommentsLoadEvent()),
      child: Scaffold(
        backgroundColor: ColorStyles.mainBackgroundColor,
          appBar: appBar(),
          body: BlocBuilder<CommentsBloc, CommentsState>(
            builder: (context, state) {
              if (state is CommentsInitialState) {
                return Text('No data received',
                  style: TextStyles.greyDarkBoldStyle.copyWith(fontSize: 20),);
              }

              if (state is CommentsLoadingState) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is CommentsSuccesState) {
                // var count = 0;
                // for(var i = 0; i < state.comments.length; i++) {
                //   if(state.comments[i].postId == id)
                //     count++;
                // }
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: state.comments.length,
                    itemBuilder: (context, index) {
                      if(id == state.comments[index].postId) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: CommentUser(index: index, id: this.id),
                        );
                      }

                      return SizedBox.shrink();
                    }
                );
              };

              if (state is CommentsErrorState) {
                return Text('Error fetching comments total list');
              }

              return SizedBox.shrink();
            },
          )
      ),
    );
  }


  AppBar appBar() {
    return AppBar(
      title: Text('Comments',
          style: TextStyles.greyDarkSemiBoldStyle.copyWith(fontSize: 20,)),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 12,
              spreadRadius: 0,
            ),
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 0,
            ),
            BoxShadow(
              offset: Offset(0, 1),
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
    );
  }
}
