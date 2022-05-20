import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../l10n/chem_solution_localizations.dart';

enum MaterialGroup {
  @JsonValue('BasicOxides')
  basicOxides,
  @JsonValue('AcidOxides')
  acidOxides,
  @JsonValue('AmphotericOxides')
  amphotericOxides,
  @JsonValue('Alkalis')
  alkalis,
  @JsonValue('InsolubleBases')
  insolubleBases,
  @JsonValue('AmphotericBases')
  amphotericBases,
  @JsonValue('Acids')
  acids,
  @JsonValue('Salts')
  salts,
  @JsonValue('AcidicSalts')
  acidicSalts,
  @JsonValue('BasicSalts')
  basicSalts,
  @JsonValue('Peroxides')
  peroxides,
  @JsonValue('SimpleMaterials')
  simpleMaterials,
}

extension MaterialGroupExt on MaterialGroup {
  String getTitle(BuildContext context) {
    final loc = ChemSolutionLocalizations.of(context);
    switch (this) {
      case MaterialGroup.basicOxides:
        return loc.basicOxides;
      case MaterialGroup.acidOxides:
        return loc.acidOxides;
      case MaterialGroup.amphotericOxides:
        return loc.amphotericOxides;
      case MaterialGroup.alkalis:
        return loc.alkalis;
      case MaterialGroup.insolubleBases:
        return loc.insolubleBases;
      case MaterialGroup.amphotericBases:
        return loc.amphotericBases;
      case MaterialGroup.acids:
        return loc.acids;
      case MaterialGroup.salts:
        return loc.salts;
      case MaterialGroup.acidicSalts:
        return loc.acidicSalts;
      case MaterialGroup.basicSalts:
        return loc.basicSalts;
      case MaterialGroup.peroxides:
        return loc.peroxides;
      case MaterialGroup.simpleMaterials:
        return loc.simpleMaterials;
    }
  }
}
