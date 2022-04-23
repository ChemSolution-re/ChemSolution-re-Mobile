import 'package:json_annotation/json_annotation.dart';

enum ElementCategory {
  @JsonValue('AlkaliMetals')
  alkaliMetals,
  @JsonValue('AlkalineEarthMetals')
  alkalineEarthMetals,
  @JsonValue('TransitionMetals')
  transitionMetals,
  @JsonValue('Lanthanides')
  lanthanides,
  @JsonValue('Actinoids')
  actinoids,
  @JsonValue('Semi_metals')
  semiMetals,
  @JsonValue('Post_transitionMetals')
  postTransitionMetals,
  @JsonValue('NobleGases')
  nobleGases,
  @JsonValue('Non_metals')
  nonMetals,
}
