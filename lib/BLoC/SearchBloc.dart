import 'package:GiantBombAppFlutter/Repository/GameResponse.dart';
import 'package:GiantBombAppFlutter/Repository/Repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  final _repository = Repository();

  BehaviorSubject<GameResponse> _searchSubjectBehavior =
      BehaviorSubject<GameResponse>();

  BehaviorSubject<GameResponse> get searchSubject => _searchSubjectBehavior;
  dispose() {
    _searchSubjectBehavior.close();
  }

  searchGames(String query) async {
    GameResponse response = await _repository.search(query);

    _searchSubjectBehavior.sink.add(response);
  }
}
