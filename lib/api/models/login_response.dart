import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  final String accessToken;
  final String userId;

  const LoginResponse({
    required this.accessToken,
    required this.userId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  List<Object> get props => [accessToken, userId];
}
