// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Achievement _$AchievementFromJson(Map<String, dynamic> json) => Achievement(
      id: json['id'] as String,
      heading: json['heading'] as String,
      imgAchievement: json['imgAchievement'] as String,
      description: json['description'] as String,
      moneyReward: json['moneyReward'] as int,
      ratingReward: json['ratingReward'] as int,
    );

Map<String, dynamic> _$AchievementToJson(Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'heading': instance.heading,
      'imgAchievement': instance.imgAchievement,
      'description': instance.description,
      'moneyReward': instance.moneyReward,
      'ratingReward': instance.ratingReward,
    };
