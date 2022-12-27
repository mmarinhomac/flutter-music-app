import 'dart:convert';
import 'package:http/http.dart';

class DeezerService {
  final String postsURL = "https://api.spotify.com/v1/tracks";

  Future<void> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    try {
      List<dynamic> body = jsonDecode(res.body);
      // print('request');
      print(body);
    } catch (error) {
      print(error);
    }
  }
}
// client id
// 8be83e250db940ab88286f2ff15e07e6
// client secret
// 9fa301279ce849eab871b1f02b6565fd