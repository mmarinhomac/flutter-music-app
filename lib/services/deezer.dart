import 'dart:convert';
import 'package:http/http.dart';

class DeezerService {
  final String tracks = "https://api.deezer.com/chart/tracks";
  final String search = "https://api.deezer.com/search";

  Future<Map> getInitialData() async {
    Response res = await get(Uri.parse(tracks));

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

  Future<Map> getTracksBySearch(String value) async {
    Response res = await get(Uri.parse('$search?q=$value'));

    try {
      Map body = jsonDecode(res.body);
      return {
        'error': null,
        'tracks': body['data'],
      };
    } catch (error) {
      return {
        'error': error,
        'tracks': [],
      };
    }
  }
}
