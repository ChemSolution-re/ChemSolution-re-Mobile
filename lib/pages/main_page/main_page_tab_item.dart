import 'package:chem_solution/l10n/chem_solution_localizations.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

enum MainPageTabItem {
  elements,
  newsAnsFacts,
  cribs,
  myProfile,
}

extension MainPageTabItemExt on MainPageTabItem {
  IconData get iconData {
    switch (this) {
      case MainPageTabItem.elements:
        return CommunityMaterialIcons.atom;
      case MainPageTabItem.newsAnsFacts:
        return CommunityMaterialIcons.newspaper;
      case MainPageTabItem.cribs:
        return CommunityMaterialIcons.note_search;
      case MainPageTabItem.myProfile:
        return CommunityMaterialIcons.account;
    }
  }

  String getLabel(BuildContext context) {
    final locatizations = ChemSolutionLocalizations.of(context);
    switch (this) {
      case MainPageTabItem.elements:
        return locatizations.elements;
      case MainPageTabItem.newsAnsFacts:
        return locatizations.newsAnsFacts;
      case MainPageTabItem.cribs:
        return locatizations.cribs;
      case MainPageTabItem.myProfile:
        return locatizations.myProfile;
    }
  }
}
