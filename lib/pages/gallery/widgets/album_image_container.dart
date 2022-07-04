import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';
import 'package:http/http.dart' as http;
import 'package:innlab_bloc_test_example/pages/gallery/bloc/gallery_state.dart';
import 'package:innlab_bloc_test_example/pages/gallery/model/gallery.dart';
import 'package:innlab_bloc_test_example/pages/gallery/services/gallery_repository.dart';

import '../bloc/gallery_bloc.dart';
import '../bloc/gallery_event.dart';

class AlbumImageContainer extends StatefulWidget {
  final int albumId;
  final String title;

  AlbumImageContainer({Key? key, required this.albumId, required this.title}) : super(key: key);

  @override
  State<AlbumImageContainer> createState() => _AlbumImageContainerState();

}

class _AlbumImageContainerState extends State<AlbumImageContainer> {
  final galleryRepository = GalleryRepository();
  @override
  Widget build(BuildContext context)  {
          return BlocProvider(create: (context) => GalleryBloc(galleryRepository)..add(GalleryLoadEvent()),
          child: BlocBuilder<GalleryBloc, GalleryState>(
              builder: (context,state) {
                if(state is GalleryInitialState) {
                  return Text('No data received');
                }

                if(state is GalleryLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }

                if(state is GallerySuccessState) {
                  Gallery galleryList = Gallery();
                  for(var i = 0; i < state.gallery.length; i++) {
                    if(widget.albumId == state.gallery[i].albumId) {
                      galleryList = state.gallery[i];
                      break;
                    }
                  }

                  return Container (
                    decoration: BoxDecoration(
                      image: DecorationImage  (
                        image: Image.network('${galleryList.url}').image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('${galleryList.title}', style: TextStyles.greyDarkMediumStyle.copyWith(fontSize: 14),),
                          ],
                        )
                    ),
                  );
                }

                if(state is GalleryErrorState) {
                  return Text('Error fetching Album Image Container');
                }

                return SizedBox.shrink();
              }),
          );


        }


}
