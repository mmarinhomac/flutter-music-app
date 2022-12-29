import 'package:music_app/common/models/music.dart';
import 'package:music_app/modules/home/business/music_data.dart';

class MusicBusiness {
  final List data;

  const MusicBusiness(this.data);

  List<Music> getTracks() {
    try {
      return MusicFormatData(data).formatMusicList();
    } catch (error) {
      // handle error
      return [];
    }
  }
}
