import 'package:http/http.dart';
import 'dart:convert';
import './anime_info.dart';

class GetAnime {
  final String name;
  List resultData;
  List<AnimeInfo> results;
  bool errorStatus;

  GetAnime({this.name});

  Future<void> getAnime() async {
    try {
      Response response =
          await get('https://api.jikan.moe/v3/search/anime?q=$name');
      Map data = jsonDecode(response.body);
      resultData = data['results'];
      results = resultData.map((e) {
        return AnimeInfo(
          title: e['title'],
          episodes: e['episodes'].toInt(),
          imageUrl: e['image_url'],
          rating: e['rated'],
          score: e['score'].toDouble(),
          synopsis: e['synopsis'],
          type: e['type'],
        );
      }).toList();
      errorStatus=false;
    } catch (e) {
      errorStatus=true;
    }
  }
}
