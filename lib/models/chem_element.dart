import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'element_category.dart';
import 'element_valence.dart';

part 'chem_element.g.dart';

@JsonSerializable()
class ChemElement extends Equatable {
  final int elementId;
  @JsonKey(defaultValue: '')
  final String symbol;
  @JsonKey(defaultValue: '')
  final String name;
  final double atomicWeight;
  final int neutronQuantity;
  final double atomicRadius;
  final double? electronegativity;
  final int energyLevels;
  final double? meltingTemperature;
  final double? boilingTemperature;
  final bool isLocked;
  @JsonKey(defaultValue: '')
  final String info;
  @JsonKey(defaultValue: '')
  final String imgSymbol;
  @JsonKey(defaultValue: '')
  final String imgAtom;
  final int price;
  final int group;
  @JsonKey(name: 'elementCategory')
  final ElementCategory category;
  @JsonKey(name: 'elementValences')
  final List<ElementValence> valences;

  const ChemElement({
    required this.elementId,
    required this.symbol,
    required this.name,
    required this.atomicWeight,
    required this.neutronQuantity,
    required this.atomicRadius,
    required this.electronegativity,
    required this.energyLevels,
    required this.meltingTemperature,
    required this.boilingTemperature,
    required this.isLocked,
    required this.info,
    required this.imgSymbol,
    required this.imgAtom,
    required this.price,
    required this.group,
    required this.category,
    required this.valences,
  });

  factory ChemElement.fromJson(Map<String, dynamic> json) {
    return _$ChemElementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChemElementToJson(this);

  @override
  List<Object?> get props {
    return [
      elementId,
      symbol,
      name,
      atomicWeight,
      neutronQuantity,
      atomicRadius,
      electronegativity,
      energyLevels,
      meltingTemperature,
      boilingTemperature,
      isLocked,
      info,
      imgSymbol,
      imgAtom,
      price,
      group,
      category,
      valences,
    ];
  }
}
