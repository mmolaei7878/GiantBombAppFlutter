import 'dart:convert';

import 'package:http/http.dart' as http;

class Repository {
  final apiKey = '1a9b8dd48ac9a77467c61db002f9d234fbdc8b87';

  Future<void> getGames() async {
    final url =
        'https://www.giantbomb.com/api/games/?api_key=$apiKey&format=json&limit=20&platforms=PC,PS4&field_list=id,name,image,deck,date_last_updated,description,image_tags,guid,number_of_user_reviews,site_detail_url';
    final response = await http.get(url);
    print(jsonDecode(response.body));
  }
}

final repository = Repository();
