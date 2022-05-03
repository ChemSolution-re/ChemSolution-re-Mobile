import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest extends Equatable {
  final String userEmail;
  final String userName;
  final String password;
  final DateTime dateOfBirth;

  const RegisterRequest({
    required this.userEmail,
    required this.userName,
    required this.password,
    required this.dateOfBirth,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  @override
  List<Object> get props => [userEmail, userName, password, dateOfBirth];
}
