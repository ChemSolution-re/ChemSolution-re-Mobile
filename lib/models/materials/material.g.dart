// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChemMaterial _$ChemMaterialFromJson(Map<String, dynamic> json) => ChemMaterial(
      id: json['id'] as String,
      image: json['image'] as String,
      formula: json['formula'] as String,
      name: json['name'] as String,
      info: json['info'] as String,
      materialGroup: $enumDecode(_$MaterialGroupEnumMap, json['materialGroup']),
    );

Map<String, dynamic> _$ChemMaterialToJson(ChemMaterial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'formula': instance.formula,
      'name': instance.name,
      'info': instance.info,
      'materialGroup': _$MaterialGroupEnumMap[instance.materialGroup],
    };

const _$MaterialGroupEnumMap = {
  MaterialGroup.basicOxides: 'BasicOxides',
  MaterialGroup.acidOxides: 'AcidOxides',
  MaterialGroup.amphotericOxides: 'AmphotericOxides',
  MaterialGroup.alkalis: 'Alkalis',
  MaterialGroup.insolubleBases: 'InsolubleBases',
  MaterialGroup.amphotericBases: 'AmphotericBases',
  MaterialGroup.acids: 'Acids',
  MaterialGroup.salts: 'Salts',
  MaterialGroup.acidicSalts: 'AcidicSalts',
  MaterialGroup.basicSalts: 'BasicSalts',
  MaterialGroup.peroxides: 'Peroxides',
  MaterialGroup.simpleMaterials: 'SimpleMaterials',
};
