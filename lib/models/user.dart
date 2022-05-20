import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String id;
  final String userEmail;
  final String userName;
  final DateTime dateOfBirth;
  final int balance;
  final int rating;
  final int honesty;

  const User({
    required this.id,
    required this.userEmail,
    required this.userName,
    required this.dateOfBirth,
    required this.balance,
    required this.rating,
    required this.honesty,
  });

  User.empty()
      : id = '',
        userEmail = '',
        userName = '',
        dateOfBirth = DateTime.now(),
        balance = 0,
        rating = 0,
        honesty = 0;

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      userEmail,
      userName,
      dateOfBirth,
      balance,
      rating,
      honesty,
    ];
  }
}
