import 'package:music_app/common/models/album.dart';

class AlbumFormatData {
  final List data;

  const AlbumFormatData(this.data);

  List<Album> formatAlbumList() {
    try {
      return data.map((item) {
        // title
        final int titleLength = item['title'].toString().length;
        final bool titleLong = titleLength >= 12;
        final String title = item['title']
                .toString()
                .substring(0, titleLong ? 12 : titleLength) +
            (titleLong ? '...' : '');

        // artist
        final int artistLength = item['artist']['name'].toString().length;
        final bool artistLong = artistLength >= 14;
        final String artist = item['artist']['name']
                .toString()
                .substring(0, artistLong ? 14 : artistLength) +
            (artistLong ? '...' : '');

        return Album(
          id: item['id'].toString(),
          title: title,
          artist: artist,
          image: item['cover_medium'],
        );
      }).toList();
    } catch (error) {
      // handle error
      return [];
    }
  }
}
