// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handled_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandledError _$HandledErrorFromJson(Map<String, dynamic> json) => HandledError(
      errorMessage: json['errorMessage'] as String,
      stausCode: json['stausCode'] as int?,
    );

Map<String, dynamic> _$HandledErrorToJson(HandledError instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'stausCode': instance.stausCode,
    };
