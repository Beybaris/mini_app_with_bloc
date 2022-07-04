
import '../model/gallery.dart';

abstract class GalleryState{}

class GalleryInitialState extends GalleryState{}

class GalleryLoadingState extends GalleryState{}

class GallerySuccessState extends GalleryState{
  List<Gallery> gallery;

  GallerySuccessState({required this.gallery});
}

class GalleryErrorState extends GalleryState {

}