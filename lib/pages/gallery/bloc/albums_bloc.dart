import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/pages/gallery/bloc/albums_event.dart';
import 'package:innlab_bloc_test_example/pages/gallery/bloc/albums_state.dart';
import 'package:innlab_bloc_test_example/pages/gallery/model/Albums.dart';
import 'package:innlab_bloc_test_example/pages/gallery/services/albums_repository.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {

  final AlbumsRepository albumsRepository;

  AlbumsBloc({required this.albumsRepository}) : super(AlbumsInitialState()) {
    on<AlbumsLoadEvent>((event, emit) async {
      emit(AlbumsLoadingState());

      try{
       final List<Albums> albumsList = await albumsRepository.getAllAlbums();
       emit(AlbumsLoadedState(listAlbums: albumsList));
      }catch(_) {
        emit(AlbumsErrorState());
      }
    });
  }

}