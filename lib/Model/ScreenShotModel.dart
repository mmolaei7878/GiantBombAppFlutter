class ScreenShotModel {
  final String screen_url;
  ScreenShotModel(this.screen_url);
  ScreenShotModel.fromJson(Map<String, dynamic> json)
      : screen_url = json['screen_url'];
}
