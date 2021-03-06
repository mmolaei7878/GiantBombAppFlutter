import 'dart:convert';
import '../Model/ScreenResponse.dart';
import 'package:GiantBombAppFlutter/Repository/GameResponse.dart';
import 'package:http/http.dart' as http;

class Repository {
  final apiKey = '1a9b8dd48ac9a77467c61db002f9d234fbdc8b87';

  Future addToFavorites({String id, String userId}) async {
    final url =
        'https://giantbombappflutter-default-rtdb.firebaseio.com/favorites/$userId/$id.json';
    final response = await http.put(
      url,
      body: id,
    );
    print(jsonDecode(response.body));
  }

  Future getFavorite({String userId, String id}) async {
    final url =
        'https://giantbombappflutter-default-rtdb.firebaseio.com/favorites/$userId/$id.json';
    final response = await http.get(
      url,
    );
    final result = jsonDecode(response.body.toString());
    print(jsonDecode(response.body));
    return result;
  }

  Future deleteFromFavorites({String userId, String id}) async {
    final url =
        'https://giantbombappflutter-default-rtdb.firebaseio.com/favorites/$userId/$id.json';
    final resposne = await http.delete(
      url,
    );
    print(jsonDecode(resposne.body));
  }

  Future<GameResponse> getGames({int limit = 80}) async {
    final url =
        'https://www.giantbomb.com/api/games/?api_key=$apiKey&format=json&limit=$limit&filter=platforms:146&field_list=id,name,image,deck,date_last_updated,description,image_tags,guid,number_of_user_reviews,site_detail_url';
    final response = await http.get(url);
    final result = jsonDecode(response.body)['results'];
    return GameResponse.fromJson(result);
  }

  Future<GameResponse> getmore({int limit = 80}) async {
    final url =
        'https://www.giantbomb.com/api/games/?api_key=$apiKey&format=json&limit=$limit&field_list=id,name,image,deck,date_last_updated,description,image_tags,guid,number_of_user_reviews,site_detail_url';
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
