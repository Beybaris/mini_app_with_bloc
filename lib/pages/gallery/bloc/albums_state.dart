import 'package:innlab_bloc_test_example/pages/gallery/model/Albums.dart';
import 'package:innlab_bloc_test_example/pages/gallery/services/albums_repository.dart';

abstract class AlbumsState {}

class AlbumsInitialState extends AlbumsState {}

class AlbumsLoadingState extends AlbumsState {}

class AlbumsLoadedState extends AlbumsState {
 List<Albums> listAlbums;

  AlbumsLoadedState({required this.listAlbums});

}

class AlbumsErrorState extends AlbumsState {}
