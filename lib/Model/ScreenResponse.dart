import '../Model/ScreenShotModel.dart';

class ScreenResponse {
  List<ScreenShotModel> screenShots;
  ScreenResponse(this.screenShots);
  ScreenResponse.fromJson(List list)
      : screenShots = list.map((e) => ScreenShotModel.fromJson(e)).toList();
}
