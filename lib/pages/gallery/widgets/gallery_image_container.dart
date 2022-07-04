import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innlab_bloc_test_example/core/colorStyles_const.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';
import 'package:http/http.dart' as http;
import 'package:innlab_bloc_test_example/pages/gallery/model/gallery.dart';

class GalleryImageContainer extends StatefulWidget {
  final int albumId;
  final String title;

  GalleryImageContainer({Key? key, required this.albumId, required this.title}) : super(key: key);

  @override
  State<GalleryImageContainer> createState() => _GalleryImageContainerState();
}

class _GalleryImageContainerState extends State<GalleryImageContainer> {

  List<Gallery> photoList = <Gallery>[];

  @override
  void initState() {
    super.initState();
    getCommentsfromApi();
  }


  Future<dynamic> getCommentsfromApi() async {
    String albumId = widget.albumId.toString();
    http
        .get(Uri.parse(
        "https://jsonplaceholder.typicode.com/photos?albumId=$albumId"))
        .then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        photoList = list.map((model) => Gallery.fromJson(model)).toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.mainBackgroundColor,
      appBar: appbar(),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6
          ),
          itemCount: photoList.length,
          itemBuilder: (context, index) {
            return Container(
              // width: 100,
              // height: 100,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network('${photoList[index].thumbnailUrl}').image,
                  fit: BoxFit.cover,

                ),
              ),
              child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${photoList[index].title}', style: TextStyles.greyDarkMediumStyle.copyWith(fontSize: 14),),
                    ],
                  )
              ),
            );
          }),
    );


  }

  AppBar appbar() {
    return  AppBar(
      title: Text('Gallery', style: TextStyles.greyDarkSemiBoldStyle.copyWith(fontSize: 20,)),
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
