import 'package:flutter/material.dart';

import '../../../../../di/locator.dart';
import '../../../../../l10n/chem_solution_localizations.dart';
import '../../../../../models/elements/chem_element.dart';
import '../../../../../models/elements/element_category.dart';
import '../../../../../services/preferences_service.dart';
import '../../../../../themes/main_theme.dart';
import '../../../../../utils/chem_solution_toasts.dart';
import '../../../../element_details_page/element_details_page.dart';

class ElementTile extends StatelessWidget {
  final ChemElement element;

  const ElementTile({
    Key? key,
    required this.element,
  }) : super(key: key);

  bool get isLoggedIn => locator<PreferencesService>().isLoggedIn;

  bool get isLocked => isLoggedIn && (!element.isLocked || element.isBought);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLocked
          ? () => Navigator.of(context).push(
                ElementDetailsPage.getRoute(element),
              )
          : () {
              final message = isLoggedIn
                  ? ChemSolutionLocalizations.of(context).youShouldBuyElement
                  : ChemSolutionLocalizations.of(context).youShouldBeAuth;
              ChemSolutionToasts.of(context).showError(message: message);
            },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isLocked
              ? ChemSolutionAppTheme.color(context).elementTileBackground
              : ChemSolutionAppTheme.color(context).blockedElement,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                element.imgSymbol,
                height: 160,
                width: 160,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(child: _buildInfo(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final loc = ChemSolutionLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleAndSubtitle(
          context,
          loc.elementId,
          element.elementId,
        ),
        _buildTitleAndSubtitle(
          context,
          loc.symbol,
          element.symbol,
        ),
        _buildTitleAndSubtitle(
          context,
          loc.name,
          element.name,
        ),
        _buildTitleAndSubtitle(
          context,
          loc.category,
          element.category.getLabel(context),
        ),
        _buildTitleAndSubtitle(
          context,
          loc.atomWeight,
          element.atomicWeight,
        ),
        _buildTitleAndSubtitle(
          context,
          loc.valency,
          element.valenceLabel,
        ),
      ],
    );
  }

  Widget _buildTitleAndSubtitle(
    BuildContext context,
    String title,
    dynamic subtitle,
  ) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: Theme.of(context).textTheme.headline5,
        children: [
          TextSpan(
            text: '$subtitle',
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
