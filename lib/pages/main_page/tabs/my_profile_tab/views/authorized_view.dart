import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/chem_solution_localizations.dart';
import '../../../../profile/achievements_page/achievement_page.dart';
import '../../../../profile/liked_posts_page/liked_posts_page.dart';
import '../../../../profile/materials_page/materials_page.dart';
import '../../../../profile/profile_page/profile_page.dart';
import '../../../../profile/requests_page/requests_page.dart';
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
                iconData: CommunityMaterialIcons.face_shimmer,
                onPressed: () => Navigator.of(context).push(
                  ProfilePage.getRoute(),
                ),
              ),
              ProfileButton.secondary(
                title: ChemSolutionLocalizations.of(context).saved,
                iconData: CommunityMaterialIcons.heart,
                onPressed: () => Navigator.of(context).push(
                  LikedPostsPage.getRoute(),
                ),
              ),
              ProfileButton.primary(
                title: ChemSolutionLocalizations.of(context).achievemens,
                iconData: CommunityMaterialIcons.gold,
                onPressed: () => Navigator.of(context).push(
                  AchievementsPage.getRoute(),
                ),
              ),
              ProfileButton.secondary(
                title: ChemSolutionLocalizations.of(context).requests,
                iconData: CommunityMaterialIcons.message,
                onPressed: () => Navigator.of(context).push(
                  RequestsPage.getRoute(),
                ),
              ),
              ProfileButton.primary(
                title: ChemSolutionLocalizations.of(context).openedMaterials,
                iconData: CommunityMaterialIcons.flask,
                onPressed: () => Navigator.of(context).push(
                  MaterialsPage.getRoute(),
                ),
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
