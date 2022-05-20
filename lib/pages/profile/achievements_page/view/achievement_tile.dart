import 'package:flutter/material.dart';

import '../../../../l10n/chem_solution_localizations.dart';
import '../../../../models/materials/achievement.dart';
import '../../../../resources/app_image_assets.dart';

class AchievementTile extends StatelessWidget {
  final Achievement achievement;

  const AchievementTile({
    Key? key,
    required this.achievement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: ListTile(
        leading: Image.network(
          achievement.imgAchievement,
          width: 120,
        ),
        title: Text(
          achievement.heading,
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Text(
          achievement.description,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      children: [
        ListTile(
          leading: Image.asset(
            AppImageAssets.coin,
            width: 50,
          ),
          title: Text(
            '${achievement.moneyReward}',
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            ChemSolutionLocalizations.of(context).coins,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        ListTile(
          leading: Image.asset(
            AppImageAssets.trophy,
            width: 50,
          ),
          title: Text(
            '${achievement.ratingReward}',
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            ChemSolutionLocalizations.of(context).rating,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
