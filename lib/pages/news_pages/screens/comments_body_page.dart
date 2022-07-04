import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';

import '../bloc/comments_bloc.dart';
import '../bloc/comments_state.dart';
import '../widgets/comment_user.dart';

class CommentsBodyPage extends StatelessWidget {
  final String title;
  final String description;
  final int id;

  const CommentsBodyPage({Key? key, required this.title, required this.description, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('${title}',
                style: TextStyles.greyDarkSemiBoldStyle
            ),
          ),
          const SizedBox(height: 26),

          Container(
            child: Text('$description',
          style: TextStyles.greyDarkMediumStyle.copyWith(fontSize: 12)),

          ),
          Container(
            padding: EdgeInsets.only(top: 32),
            child: BlocBuilder<CommentsBloc, CommentsState>(
              builder: (context, state){
                if(state is CommentsInitialState) {
                  return Text('No data received', style: TextStyles.greyDarkBoldStyle.copyWith(fontSize: 20));
                }

                if(state is CommentsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }

                if(state is CommentsSuccesState) {
                  var count = 2;
                  var sizePostId = 0;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) {
                        if(id == state.comments[index].postId)
                          sizePostId++;
                        if(id == state.comments[index].postId && count != 0) {
                          count--;
                          return CommentUser(index: index, id: id,);
                        }
                        return SizedBox.shrink();
                      });
                }

                if(state is CommentsErrorState) {
                  return Text('Error fetching Comments page');
                }

                return SizedBox.shrink();


              },
            )
          ),
          // SizedBox(height: 37,),
        ],
      ),
    );
  }
}
