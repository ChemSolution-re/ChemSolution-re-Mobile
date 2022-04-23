import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/chem_solution_localizations.dart';
import 'profile_button.dart';

class UnautorizedView extends StatelessWidget {
  const UnautorizedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ProfileButton.primary(
          title: ChemSolutionLocalizations.of(context).auth,
          iconData: CommunityMaterialIcons.login,
          onPressed: () {},
        ),
      ),
    );
  }
}
