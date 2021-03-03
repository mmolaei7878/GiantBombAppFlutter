import 'package:json_annotation/json_annotation.dart';

part 'gm.g.dart';

@JsonSerializable()
class GameModel {
  final String date_last_updated;
  final String deck;
  final String description;
  final String guid;
  final int id;
  final String name;
  final int number_of_user_reviews;
  final String site_detail_url;
  final Image image;
  GameModel(
      {this.date_last_updated,
      this.deck,
      this.description,
      this.guid,
      this.id,
      this.image,
      this.name,
      this.number_of_user_reviews,
      this.site_detail_url});
  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);
  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}

@JsonSerializable()
class Image {
  final String screen_large_url;
  Image(this.screen_large_url);
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
