import 'dart:convert';

import 'package:GiantBombAppFlutter/Repository/GameResponse.dart';
import 'package:http/http.dart' as http;

class Repository {
  final apiKey = '1a9b8dd48ac9a77467c61db002f9d234fbdc8b87';

  Future<GameResponse> getGames() async {
    final url =
        'https://www.giantbomb.com/api/games/?api_key=$apiKey&format=json&limit=30&platforms=20&field_list=id,name,image,deck,date_last_updated,description,image_tags,guid,number_of_user_reviews,site_detail_url';
    final response = await http.get(url);
    final result = jsonDecode(response.body)['results'];
    return GameResponse.fromJson(result);
  }

  Future<GameResponse> search(String query) async {
    final url =
        'https://www.giantbomb.com/api/search/?api_key=$apiKey&format=json&query=$query';
    final response = await http.get(url);
    final result = jsonDecode(response.body)['results'];
    return GameResponse.fromJson(result);
  }
}

final repository = Repository();
