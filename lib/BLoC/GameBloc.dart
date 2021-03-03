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

  disposeGameStream() {
    _gameBehaviorSubject.close();
    _subjectScreenShot.close();
  }

  getGames() async {
    GameResponse response = await _repository.getGames();
    _gameBehaviorSubject.sink.add(response);
  }

  getScreenShots(String guid) async {
    ScreenResponse response = await _repository.getScreenShots(guid);
    _subjectScreenShot.sink.add(response);
  }
}

final gameBloc = GameBloc();
