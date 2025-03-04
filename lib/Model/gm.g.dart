// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  return GameModel(
    date_last_updated: json['date_last_updated'] as String,
    deck: json['deck'] as String,
    description: json['description'] as String,
    guid: json['guid'] as String,
    id: json['id'] as int,
    image: json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
    name: json['name'] as String,
    number_of_user_reviews: json['number_of_user_reviews'] as int,
    site_detail_url: json['site_detail_url'] as String,
  );
}

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'date_last_updated': instance.date_last_updated,
      'deck': instance.deck,
      'description': instance.description,
      'guid': instance.guid,
      'id': instance.id,
      'name': instance.name,
      'number_of_user_reviews': instance.number_of_user_reviews,
      'site_detail_url': instance.site_detail_url,
      'image': instance.image,
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    json['screen_large_url'] as String,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'screen_large_url': instance.screen_large_url,
    };
