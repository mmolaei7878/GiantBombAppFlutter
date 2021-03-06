import 'package:GiantBombAppFlutter/Model/gm.dart';

class GameResponse {
  final List<GameModel> gameList;
  GameResponse(this.gameList);
  GameResponse.fromJson(List json)
      : gameList = json.map((e) => GameModel.fromJson(e)).toList();
}
