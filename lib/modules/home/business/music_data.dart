import 'package:music_app/common/models/music.dart';

class MusicFormatData {
  final List data;

  const MusicFormatData(this.data);

  List<Music> formatMusicList() {
    try {
      return data.map((item) {
        // title
        final int titleLength = item['title_short'].toString().length;
        final bool titleLong = titleLength >= 22;
        final String title = item['title_short']
                .toString()
                .substring(0, titleLong ? 22 : titleLength) +
            (titleLong ? '...' : '');

        // time
        final int timeIndexAux =
            (item['duration'] / 60).toString().indexOf('.');
        final String time = double.parse((item['duration'] / 60).toString())
            .toStringAsFixed(2)
            .toString()
            .substring(0, timeIndexAux + 3)
            .replaceAll('.', ':');

        return Music(
          id: item['id'].toString(),
          title: title,
          artist: item['artist']['name'],
          image: item['album']['cover_medium'],
          time: time,
          preview: item['preview'],
        );
      }).toList();
    } catch (error) {
      // handle error
      return [];
    }
  }
}
