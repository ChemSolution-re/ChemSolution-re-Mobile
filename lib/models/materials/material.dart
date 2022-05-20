import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'material_group.dart';

part 'material.g.dart';

@JsonSerializable()
class ChemMaterial extends Equatable {
  final String id;
  final String image;
  final String formula;
  final String name;
  final String info;
  final MaterialGroup materialGroup;

  const ChemMaterial({
    required this.id,
    required this.image,
    required this.formula,
    required this.name,
    required this.info,
    required this.materialGroup,
  });

  factory ChemMaterial.fromJson(Map<String, dynamic> json) {
    return _$ChemMaterialFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChemMaterialToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      image,
      formula,
      name,
      info,
      materialGroup,
    ];
  }
}
