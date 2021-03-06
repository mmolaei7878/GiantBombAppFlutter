import 'package:GiantBombAppFlutter/Repository/GameResponse.dart';
import 'package:GiantBombAppFlutter/Repository/Repository.dart';
import 'package:rxdart/rxdart.dart';
import '../Model/ScreenResponse.dart';

class GameBloc {
  final _repository = Repository();

  BehaviorSubject<GameResponse> _gameBehaviorSubject =
      BehaviorSubject<GameResponse>();

  PublishSubject<ScreenResponse> _subjectScreenShot =
      PublishSubject<ScreenResponse>();

  BehaviorSubject<GameResponse> get subject => _gameBehaviorSubject;

  PublishSubject<ScreenResponse> get subjectScreenShot => _subjectScreenShot;

  var loading = false;
  disposeGameStream() {
    _gameBehaviorSubject.close();
    _subjectScreenShot.close();
  }

  getGames(int limit) async {
    loading = true;
    GameResponse response = await _repository.getGames(limit: limit);
    _gameBehaviorSubject.sink.add(response);
    loading = false;
  }

  getmore(int limit) async {
    GameResponse response = await _repository.getmore(limit: limit);
    _gameBehaviorSubject.sink.add(response);
  }

  getScreenShots(String guid) async {
    ScreenResponse response = await _repository.getScreenShots(guid);
    _subjectScreenShot.sink.add(response);
  }
}

final gameBloc = GameBloc();
