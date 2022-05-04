import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/chem_solution_localizations.dart';
import 'profile_button.dart';

class AuthorizedView extends StatelessWidget {
  final VoidCallback logout;

  const AuthorizedView({
    Key? key,
    required this.logout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              ProfileButton.primary(
                title: ChemSolutionLocalizations.of(context).myProfile,
                iconData: Icons.person_outline_sharp,
                onPressed: () {},
              ),
              ProfileButton.secondary(
                title: ChemSolutionLocalizations.of(context).saved,
                iconData: CommunityMaterialIcons.heart,
                onPressed: () {},
              ),
              ProfileButton.primary(
                title: ChemSolutionLocalizations.of(context).achievemens,
                iconData: CommunityMaterialIcons.gold,
                onPressed: () {},
              ),
              ProfileButton.secondary(
                title: ChemSolutionLocalizations.of(context).requests,
                iconData: CommunityMaterialIcons.message,
                onPressed: () {},
              ),
              ProfileButton.primary(
                title: ChemSolutionLocalizations.of(context).openedMaterials,
                iconData: CommunityMaterialIcons.atom_variant,
                onPressed: () {},
              ),
              ProfileButton.secondary(
                title: ChemSolutionLocalizations.of(context).logout,
                iconData: Icons.logout,
                onPressed: logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}