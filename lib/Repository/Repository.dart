import 'dart:convert';
import '../Model/ScreenResponse.dart';
import 'package:GiantBombAppFlutter/Repository/GameResponse.dart';
import 'package:http/http.dart' as http;

class Repository {
  final apiKey = '<<Your Api Key>>';

  Future addToFavorites({String id, String userId}) async {
    final url = '<<Your End Point>>/favorites/$userId/$id.json';
    await http.put(
      url,
      body: id,
    );
  }

  Future getFavorite({String userId, String id}) async {
    final url = '<<Your End Point>>/favorites/$userId/$id.json';
    final response = await http.get(
      url,
    );
    final result = jsonDecode(response.body.toString());
    return result;
  }

  Future deleteFromFavorites({String userId, String id}) async {
    final url = '<<Your End Point>>/favorites/$userId/$id.json';
    await http.delete(
      url,
    );
  }

  Future<GameResponse> getGames({int limit = 30}) async {
    final url =
        'https://www.giantbomb.com/api/games/?api_key=$apiKey&format=json&limit=$limit&filter=platforms:146&field_list=id,name,image,deck,date_last_updated,description,image_tags,guid,number_of_user_reviews,site_detail_url';
    final response = await http.get(url);
    final result = jsonDecode(response.body)['results'];
    return GameResponse.fromJson(result);
  }

  Future<GameResponse> getmore({int limit = 30}) async {
    final url =
        'https://www.giantbomb.com/api/games/?api_key=$apiKey&format=json&limit=$limit&filter=platforms:146&field_list=id,name,image,deck,date_last_updated,description,image_tags,guid,number_of_user_reviews,site_detail_url';
    final response = await http.get(url);
    final result = jsonDecode(response.body)['results'];
    return GameResponse.fromJson(result);
  }

  Future<GameResponse> search(String query) async {
    final url =
        'https://www.giantbomb.com/api/search/?api_key=$apiKey&format=json&query=$query';
    final response = await http.get(url);
    final result = jsonDecode(response.body)['results'];
    print(result);
    return GameResponse.fromJson(result);
  }

  Future<ScreenResponse> getScreenShots(String guid) async {
    final url =
        'https://www.giantbomb.com/api/images/$guid/?api_key=$apiKey&format=json&limit=20&filter=image_tag:Screenshots';
    final response = await http.get(url);
    final result = jsonDecode(response.body)['results'];
    return ScreenResponse.fromJson(result);
  }
}

final repository = Repository();
