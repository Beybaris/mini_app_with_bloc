import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/core/colorStyles_const.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';
import 'package:innlab_bloc_test_example/pages/gallery/bloc/albums_bloc.dart';
import 'package:innlab_bloc_test_example/pages/gallery/bloc/albums_event.dart';
import 'package:innlab_bloc_test_example/pages/gallery/bloc/albums_state.dart';
import '../services/albums_repository.dart';
import '../widgets/album_image_container.dart';
import '../widgets/gallery_image_container.dart';
class GalleryPage extends StatelessWidget {
  final albumsRepository = AlbumsRepository();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => AlbumsBloc(albumsRepository: albumsRepository)..add(AlbumsLoadEvent()),
    child: Scaffold(
      backgroundColor: ColorStyles.mainBackgroundColor,
      appBar: AppBar(
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
      ),
      body: BlocConsumer<AlbumsBloc, AlbumsState>(

        listener: (context, state) {

          log(state.toString());
          if(state is AlbumsLoadedState) {
            ScaffoldMessenger.of(context).
            showSnackBar(const SnackBar(content: Text('Albums is Loaded') ,));
          }
        },
        builder: (context, state) {
          // final GalleryBloc galleryBloc = BlocProvider.of<GalleryBloc>(context);
          if (state is AlbumsInitialState) {
            // galleryBloc.add(GalleryLoadEvent());
            return Center(child: Text(
                'No data received', style: TextStyles.greyDarkMediumStyle));
          }
          if(state is AlbumsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if(state is AlbumsLoadedState) {
            return GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              // shrinkWrap: true,
              itemCount: state.listAlbums.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>
                       GalleryImageContainer(
                           albumId: state.listAlbums[index].id!,
                           title: state.listAlbums[index].title.toString())));
                },
                  child: AlbumImageContainer(
                      albumId: state.listAlbums[index].id!,
                      title: state.listAlbums[index].title.toString())
              ),
            );
        }

          if(state is AlbumsErrorState) {
            return Center(child: Text('Error Gallery', style: TextStyles.greyDarkRegularStyle.copyWith(fontSize:  20)));
          }

          return SizedBox.shrink();
        }
      ),

    ),
    );

  }
}
