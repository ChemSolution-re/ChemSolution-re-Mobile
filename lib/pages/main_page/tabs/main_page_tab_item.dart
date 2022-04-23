import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../../l10n/chem_solution_localizations.dart';
import 'cribs_tab/cribs_tab.dart';
import 'elements_tab/elements_tab.dart';
import 'my_profile_tab/my_profile_tab.dart';
import 'news_ans_facts_tab/news_ans_facts_tab.dart';

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

  Widget get tabItem {
    switch (this) {
      case MainPageTabItem.elements:
        return ElementsTab.create();
      case MainPageTabItem.newsAnsFacts:
        return NewsAndFactsTab.create();
      case MainPageTabItem.cribs:
        return CribsTab.create();
      case MainPageTabItem.myProfile:
        return MyProfileTab.create();
    }
  }
}
