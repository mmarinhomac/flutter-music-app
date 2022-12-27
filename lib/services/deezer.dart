import 'dart:convert';
import 'package:http/http.dart';

class DeezerService {
  final String postsURL = "https://api.deezer.com/chart/tracks";

  Future<Map> getMostPopular() async {
    Response res = await get(Uri.parse(postsURL));

    try {
      Map body = jsonDecode(res.body);
      return {
        'error': null,
        'result': body['tracks']['data'],
      };
    } catch (error) {
      return {
        'error': error,
        'result': [],
      };
    }
  }
}
