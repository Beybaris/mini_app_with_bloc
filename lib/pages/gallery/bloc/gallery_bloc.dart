import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlab_bloc_test_example/pages/gallery/bloc/gallery_event.dart';
import 'package:innlab_bloc_test_example/pages/gallery/bloc/gallery_state.dart';
import 'package:innlab_bloc_test_example/pages/gallery/model/gallery.dart';
import 'package:innlab_bloc_test_example/pages/gallery/services/gallery_repository.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {

  final GalleryRepository galleryRepository;

  GalleryBloc(this.galleryRepository) : super(GalleryInitialState()) {
    on<GalleryLoadEvent>((event, emit) async {
      emit(GalleryLoadingState());

      try {
        final List<Gallery> galleryList = await galleryRepository.getAllPosts();
        emit(GallerySuccessState(gallery: galleryList));
      } catch(_) {
        emit(GalleryErrorState());
      }
    });
  }

}