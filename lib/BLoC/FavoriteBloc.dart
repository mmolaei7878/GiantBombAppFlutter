import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Repository/Repository.dart';
import '../BLoC/Authenthication.dart';

class FavoriteBloc {
  final userId = authentication.userId;
  Repository _repository = Repository();

  getFavorite(String id) async {
    final result = await _repository.getFavorite(id: id, userId: userId);
    final extracted = jsonDecode(result.toString());
    _favSubject.sink.add(extracted.toString());
  }

  addToFavorite(String id) async {
    final result = await _repository.addToFavorites(id: id, userId: userId);
    final extracted = jsonDecode(result.toString());
    _favSubject.sink.add(extracted);
  }

  deleteFromFavorites(String id) async {
    await _repository.deleteFromFavorites(id: id, userId: userId);
    _favSubject.sink.add('x');
  }

  BehaviorSubject<String> _favSubject = BehaviorSubject<String>();
  Stream<String> get streamFav => _favSubject.stream;
  disposes() {
    _favSubject.close();
  }
}

final favoriteBloc = FavoriteBloc();
