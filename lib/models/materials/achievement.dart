import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'achievement.g.dart';

@JsonSerializable()
class Achievement extends Equatable {
  final String id;
  final String heading;
  final String imgAchievement;
  final String description;
  final int moneyReward;
  final int ratingReward;

  const Achievement({
    required this.id,
    required this.heading,
    required this.imgAchievement,
    required this.description,
    required this.moneyReward,
    required this.ratingReward,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return _$AchievementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AchievementToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      heading,
      imgAchievement,
      description,
      moneyReward,
      ratingReward,
    ];
  }
}
