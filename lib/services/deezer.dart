import 'dart:convert';
import 'package:http/http.dart';

class DeezerService {
  final String postsURL = "https://api.deezer.com/chart/tracks";

  Future<Map> getInitialData() async {
    Response res = await get(Uri.parse(postsURL));

    try {
      Map body = jsonDecode(res.body);
      return {
        'error': null,
        'tracks': body['tracks']['data'],
        'albums': body['albums']['data'],
      };
    } catch (error) {
      return {
        'error': error,
        'tracks': [],
        'albums': [],
      };
    }
  }
}
