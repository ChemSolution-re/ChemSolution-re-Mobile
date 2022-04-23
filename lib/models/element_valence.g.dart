// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_valence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementValence _$ElementValenceFromJson(Map<String, dynamic> json) =>
    ElementValence(
      $enumDecode(_$ValenceEnumMap, json['valence']),
    );

Map<String, dynamic> _$ElementValenceToJson(ElementValence instance) =>
    <String, dynamic>{
      'valence': _$ValenceEnumMap[instance.valence],
    };

const _$ValenceEnumMap = {
  Valence.one: 'One',
  Valence.two: 'Two',
  Valence.three: 'Three',
  Valence.four: 'Four',
  Valence.five: 'Five',
  Valence.six: 'Six',
  Valence.seven: 'Seven',
};
