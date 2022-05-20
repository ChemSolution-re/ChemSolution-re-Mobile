import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'request_status.dart';

part 'chem_request.g.dart';

@JsonSerializable()
class ChemRequest extends Equatable {
  final String id;
  final String theme;
  final String text;
  final DateTime dateTimeSended;
  final RequestStatus status;

  const ChemRequest({
    required this.id,
    required this.theme,
    required this.text,
    required this.dateTimeSended,
    required this.status,
  });

  factory ChemRequest.fromJson(Map<String, dynamic> json) {
    return _$ChemRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChemRequestToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      theme,
      text,
      dateTimeSended,
      status,
    ];
  }
}
