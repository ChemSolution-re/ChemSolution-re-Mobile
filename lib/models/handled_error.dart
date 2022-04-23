import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'handled_error.g.dart';

@JsonSerializable()
class HandledError extends Equatable {
  final String errorMessage;
  final int? stausCode;

  const HandledError({
    required this.errorMessage,
    this.stausCode,
  });

  const HandledError.empty()
      : errorMessage = '',
        stausCode = null;

  factory HandledError.fromJson(Map<String, dynamic> json) {
    return _$HandledErrorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HandledErrorToJson(this);

  @override
  List<Object?> get props => [
        errorMessage,
        stausCode,
      ];
}
