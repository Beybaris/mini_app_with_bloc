import 'package:flutter/material.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';

class NewsContainer extends StatelessWidget {

  final String title;
  final String description;

  NewsContainer({required this.description, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        // height: 95,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xff221C44),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 0,
            ),
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 6,
              spreadRadius: 0,
            ),
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ]
        ),
        child: ListTile(
          title: Column(
            children: [
              Text(
                  '$title', style: TextStyles.greyDarkRegularStyle
              ),
              SizedBox(height: 8,),
              Column(
                children: [
                  Text('$description', style: TextStyles.greyDarkRegularStyle.copyWith(fontSize: 14, color: Colors.white),)
                ],
              )
            ],
          )
        )
      ),
    );
  }
}
