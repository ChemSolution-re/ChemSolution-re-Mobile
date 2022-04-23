import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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

  @override
  List<Object?> get props => [
        errorMessage,
        stausCode,
      ];
}
