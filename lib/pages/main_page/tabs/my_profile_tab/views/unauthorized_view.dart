import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/chem_solution_localizations.dart';
import '../../../../auth/login_page.dart';
import 'profile_button.dart';

class UnautorizedView extends StatelessWidget {
  final VoidCallback onPressed;

  const UnautorizedView({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ProfileButton.primary(
          title: ChemSolutionLocalizations.of(context).auth,
          iconData: CommunityMaterialIcons.login,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
