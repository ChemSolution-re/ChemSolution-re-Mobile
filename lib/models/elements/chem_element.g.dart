// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chem_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChemElement _$ChemElementFromJson(Map<String, dynamic> json) => ChemElement(
      elementId: json['elementId'] as int,
      symbol: json['symbol'] as String? ?? '',
      name: json['name'] as String? ?? '',
      atomicWeight: (json['atomicWeight'] as num).toDouble(),
      neutronQuantity: json['neutronQuantity'] as int,
      atomicRadius: (json['atomicRadius'] as num?)?.toDouble(),
      electronegativity: (json['electronegativity'] as num?)?.toDouble(),
      energyLevels: json['energyLevels'] as int,
      meltingTemperature: (json['meltingTemperature'] as num?)?.toDouble(),
      boilingTemperature: (json['boilingTemperature'] as num?)?.toDouble(),
      isLocked: json['isLocked'] as bool,
      info: json['info'] as String? ?? '',
      imgSymbol: json['imgSymbol'] as String? ?? '',
      imgAtom: json['imgAtom'] as String? ?? '',
      price: json['price'] as int,
      group: json['group'] as int,
      category: $enumDecode(_$ElementCategoryEnumMap, json['elementCategory']),
      valences: (json['elementValences'] as List<dynamic>)
          .map((e) => ElementValence.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBought: json['isBought'] as bool? ?? false,
    );

Map<String, dynamic> _$ChemElementToJson(ChemElement instance) =>
    <String, dynamic>{
      'elementId': instance.elementId,
      'symbol': instance.symbol,
      'name': instance.name,
      'atomicWeight': instance.atomicWeight,
      'neutronQuantity': instance.neutronQuantity,
      'atomicRadius': instance.atomicRadius,
      'electronegativity': instance.electronegativity,
      'energyLevels': instance.energyLevels,
      'meltingTemperature': instance.meltingTemperature,
      'boilingTemperature': instance.boilingTemperature,
      'isLocked': instance.isLocked,
      'info': instance.info,
      'imgSymbol': instance.imgSymbol,
      'imgAtom': instance.imgAtom,
      'price': instance.price,
      'group': instance.group,
      'elementCategory': _$ElementCategoryEnumMap[instance.category],
      'elementValences': instance.valences,
      'isBought': instance.isBought,
    };

const _$ElementCategoryEnumMap = {
  ElementCategory.alkaliMetals: 'AlkaliMetals',
  ElementCategory.alkalineEarthMetals: 'AlkalineEarthMetals',
  ElementCategory.transitionMetals: 'TransitionMetals',
  ElementCategory.lanthanides: 'Lanthanides',
  ElementCategory.actinoids: 'Actinoids',
  ElementCategory.semiMetals: 'Semi_metals',
  ElementCategory.postTransitionMetals: 'Post_transitionMetals',
  ElementCategory.nobleGases: 'NobleGases',
  ElementCategory.nonMetals: 'Non_metals',
  ElementCategory.unknown: 'Unknown',
};
