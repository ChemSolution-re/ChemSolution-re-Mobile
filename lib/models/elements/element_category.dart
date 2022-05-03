import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../l10n/chem_solution_localizations.dart';

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
  @JsonValue('Unknown')
  unknown,
}

extension ElementCategoryExt on ElementCategory {
  String getLabel(BuildContext context) {
    final loc = ChemSolutionLocalizations.of(context);
    switch (this) {
      case ElementCategory.actinoids:
        return loc.actinoids;
      case ElementCategory.alkaliMetals:
        return loc.alkaliMetals;
      case ElementCategory.alkalineEarthMetals:
        return loc.alkalineEarthMetals;
      case ElementCategory.lanthanides:
        return loc.lanthanides;
      case ElementCategory.nobleGases:
        return loc.nobleGases;
      case ElementCategory.nonMetals:
        return loc.nonMetals;
      case ElementCategory.postTransitionMetals:
        return loc.postTransitionMetals;
      case ElementCategory.semiMetals:
        return loc.semiMetals;
      case ElementCategory.transitionMetals:
        return loc.transitionMetals;
      case ElementCategory.unknown:
        return loc.unknown;
    }
  }
}
