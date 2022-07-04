import 'package:innlab_bloc_test_example/pages/gallery/model/Albums.dart';
import 'package:innlab_bloc_test_example/pages/gallery/services/albums_provider.dart';

class AlbumsRepository {
  final AlbumsProvider _albumsProvider = AlbumsProvider();

  Future<List<Albums>> getAllAlbums() => _albumsProvider.getAlbums();
}