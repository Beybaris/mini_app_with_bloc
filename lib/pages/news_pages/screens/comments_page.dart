import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/colorStyles_const.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/comments_bloc.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/bloc/comments_event.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/screens/total_comments_page.dart';
import 'package:innlab_bloc_test_example/pages/news_pages/services/news_posts_repository.dart';

import '../bloc/comments_state.dart';
import 'comments_body_page.dart';

class CommentsPage extends StatefulWidget {
  final String title;
  final String description;
  final int id;

  CommentsPage({Key? key, required this.title, required this.description, required this.id}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final commentsRepository = NewsPostsRepository();

  var count = 0;


  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => CommentsBloc(commentsRepository: commentsRepository)..add(CommentsLoadEvent()),
    child: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          if(state is CommentsInitialState) {
            return Text('No data received', style: TextStyles.greyDarkBoldStyle.copyWith(fontSize: 20));
          }

          if(state is CommentsLoadingState) {

            return Center(child: CircularProgressIndicator());
          }

          if(state is CommentsSuccesState) {

            return Scaffold(
                backgroundColor: ColorStyles.mainBackgroundColor,
                appBar: appBar(),
                body: CommentsBodyPage(title: this.widget.title, description: this.widget.description, id: this.widget.id),
              bottomNavigationBar: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xff6C63FF),
                  borderRadius: BorderRadius.circular(10.5),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0,11),
                      blurRadius: 24,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TotalCommentsPage(id: widget.id,)));
                  },
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Show me ', style: TextStyles.greyDarkBoldStyle.copyWith(color: Color.fromRGBO(255, 255, 255, 0.5))),
                          Text('${state.comments.length} results', style: TextStyles.greyDarkBoldStyle),
                          SizedBox(width: 65),
                          Icon(Icons.visibility, color: ColorStyles.whiteColor,),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            );
          }

          if(state is CommentsErrorState) {
            return Text('Error fetching Comments page');
          }

          return SizedBox.shrink();
        }),



    );

  }

  AppBar appBar() {
  return AppBar(
    title: Text('Comments', style: TextStyles.greyDarkSemiBoldStyle.copyWith(fontSize: 20,)),
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
  );
  }
}

