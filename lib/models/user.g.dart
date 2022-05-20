// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      userEmail: json['userEmail'] as String,
      userName: json['userName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      balance: json['balance'] as int,
      rating: json['rating'] as int,
      honesty: json['honesty'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userEmail': instance.userEmail,
      'userName': instance.userName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'balance': instance.balance,
      'rating': instance.rating,
      'honesty': instance.honesty,
    };
