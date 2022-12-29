import 'package:music_app/common/models/album.dart';
import 'package:music_app/modules/home/business/album_data.dart';

class AlbumBusiness {
  final List data;

  const AlbumBusiness(this.data);

  List<Album> getAlbums() {
    try {
      return AlbumFormatData(data).formatAlbumList();
    } catch (error) {
      // handle error
      return [];
    }
  }
}
