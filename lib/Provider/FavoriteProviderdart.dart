import 'dart:convert';
import '../BLoC/Authenthication.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FavoritesProvider with ChangeNotifier {
  final userId = authentication.userId;

  List<String> favorites = [];
  var isFav = false;
  Future<void> addToFavorites(String id) async {
    if (userId == null) {
      return;
    }
    final url =
        'https://giantbombappflutter-default-rtdb.firebaseio.com/favorites/$userId/$id.json';
    final response = await http.put(
      url,
      body: id,
    );
    print(jsonDecode(response.body));
  }

  Future<void> singleFavoriteStatus(String id) async {
    if (userId == null) {
      return;
    }
    final url =
        'https://giantbombappflutter-default-rtdb.firebaseio.com/favorites/$userId/$id.json';
    final response = await http.get(
      url,
    );
    final result = jsonDecode(response.body);
    print(result + '<<<<<<<<<<<<<< result');
    if (result) {}
    isFav = true;
  }

  Future<void> deleteFromFavorites(String id) async {
    final url =
        'https://giantbombappflutter-default-rtdb.firebaseio.com/favorites/$userId/$id.json';
    final resposne = await http.delete(
      url,
    );
    print(jsonDecode(resposne.body));
  }

  Future<void> getFavorites() async {
    final url =
        'https://giantbombappflutter-default-rtdb.firebaseio.com/favorites/$userId.json';
    final response = await http.get(url);
    print(jsonDecode(response.body));

    final result = jsonDecode(response.body) as Map<String, dynamic>;
    if (result == null) {
      return;
    }
    result.forEach((key, value) {
      favorites.add(key);
    });
  }
}
