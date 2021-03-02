import 'package:GiantBombAppFlutter/Repository/GameResponse.dart';
import 'package:GiantBombAppFlutter/Repository/Repository.dart';
import 'package:rxdart/rxdart.dart';

class GameBloc {
  final _repository = Repository();

  BehaviorSubject<GameResponse> _gameBehaviorSubject =
      BehaviorSubject<GameResponse>();

  BehaviorSubject<GameResponse> get subject => _gameBehaviorSubject;
  dispose() {
    _gameBehaviorSubject.close();
  }

  getGames() async {
    GameResponse response = await _repository.getGames();
    _gameBehaviorSubject.sink.add(response);
  }
}

final gameBloc = GameBloc();
