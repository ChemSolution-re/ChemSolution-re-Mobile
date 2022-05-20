// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chem_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChemRequest _$ChemRequestFromJson(Map<String, dynamic> json) => ChemRequest(
      id: json['id'] as String,
      theme: json['theme'] as String,
      text: json['text'] as String,
      dateTimeSended: DateTime.parse(json['dateTimeSended'] as String),
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ChemRequestToJson(ChemRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'theme': instance.theme,
      'text': instance.text,
      'dateTimeSended': instance.dateTimeSended.toIso8601String(),
      'status': _$RequestStatusEnumMap[instance.status],
    };

const _$RequestStatusEnumMap = {
  RequestStatus.consider: 'Сonsider',
  RequestStatus.rejected: 'Rejected',
  RequestStatus.accepted: 'Accepted',
};
