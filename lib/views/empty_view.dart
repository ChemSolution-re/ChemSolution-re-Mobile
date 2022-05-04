import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../l10n/chem_solution_localizations.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ChemSolutionLocalizations.of(context).nothingFind,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(),
          const Icon(
            CommunityMaterialIcons.heart_broken,
            size: 32,
          )
        ],
      ),
    );
  }
}
