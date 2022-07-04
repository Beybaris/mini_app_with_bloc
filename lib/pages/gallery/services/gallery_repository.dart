import 'package:innlab_bloc_test_example/pages/gallery/model/gallery.dart';
import 'package:innlab_bloc_test_example/pages/gallery/services/gallery_provider.dart';

class GalleryRepository {
  final GalleryProvider _newsProvider = GalleryProvider();

  Future<List<Gallery>> getAllPosts() => _newsProvider.getGallery();
}