import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/colorStyles_const.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';

import '../bloc/comments_bloc.dart';
import '../bloc/comments_state.dart';

class CommentUser extends StatelessWidget {
  final int index;
  final int id;

  const CommentUser({Key? key, required this.index, required this.id, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          if(state is CommentsInitialState) {
            return Text('No data received', style: TextStyles.greyDarkBoldStyle.copyWith(fontSize: 20));
          }

          if(state is CommentsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if(state is CommentsSuccesState) {
            // int count = 0;
            // List<String> list;
            // for(var i = 0; i < state.comments.length; i++) {
            //   if(state.comments[i].postId == id) {
            //
            //   }
            // }
            return Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle, size: 40, color: ColorStyles.whiteColor,),
                    SizedBox(width: 16),
                    Expanded(child: Text('${state.comments[index].name}', style: TextStyles.greyDarkSemiBoldStyle)),
                  ],
                ),
                // SizedBox(height: 16,),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 18),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${state.comments[index].body}',
                      style: TextStyles.greyDarkRegularStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.left ,
                    ),
                  ),
                )
              ],
            );
          }

          if(state is CommentsErrorState) {
            return Text('Error fetching Comments page');
          }

          return SizedBox.shrink();
    }) ;

  }
}
