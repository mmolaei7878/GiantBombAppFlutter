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
    _searchSubjectBehavior.debounce(
      (_) => TimerStream(
        true,
        Duration(milliseconds: 500),
      ).switchMap((respo) async* {
        final response = await _repository.search(query);
        yield response;
        _searchSubjectBehavior.sink.add(response);
      }),
    );
  }
}

final searchBloc = SearchBloc();
