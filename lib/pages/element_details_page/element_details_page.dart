import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../l10n/chem_solution_localizations.dart';
import '../../models/elements/chem_element.dart';
import '../../models/elements/element_category.dart';
import '../../models/elements/valence.dart';
import '../../views/chem_solution_app_bar.dart';

class ElementDetailsPage extends StatelessWidget {
  final ChemElement element;

  static PageRoute getRoute(ChemElement element) {
    return SwipeablePageRoute(builder: (_) {
      return ElementDetailsPage(element: element);
    });
  }

  const ElementDetailsPage({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = ChemSolutionLocalizations.of(context);
    return Scaffold(
      appBar: const ChemSolutionAppBar(
        isLeadingIconEnabled: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(child: Image.network(element.imgSymbol)),
            _buildTitleAndSubtitle(context, loc.elementId, element.elementId),
            _buildTitleAndSubtitle(context, loc.symbol, element.symbol),
            _buildTitleAndSubtitle(context, loc.name, element.name),
            _buildTitleAndSubtitle(
              context,
              loc.atomicWeight,
              element.atomicWeight,
            ),
            _buildTitleAndSubtitle(
              context,
              loc.neutronQuantity,
              element.neutronQuantity,
            ),
            _buildTitleAndSubtitle(
              context,
              loc.atomicRadius,
              element.atomicRadius,
            ),
            _buildTitleAndSubtitle(
              context,
              loc.electronegativity,
              element.electronegativity,
            ),
            _buildTitleAndSubtitle(
              context,
              loc.energyLevels,
              element.energyLevels,
            ),
            _buildTitleAndSubtitle(
              context,
              loc.meltingTemperature,
              element.meltingTemperature,
            ),
            _buildTitleAndSubtitle(
              context,
              loc.boilingTemperature,
              element.boilingTemperature,
            ),
            _buildTitleAndSubtitle(
              context,
              loc.category,
              element.category.getLabel(context),
            ),
            _buildTitleAndSubtitle(
              context,
              loc.valences,
              element.valences.map((e) => e.valence.number),
            ),
            _buildTitleAndSubtitle(
              context,
              loc.info,
              element.info,
            ),
            Center(
                child: Image.network(
              element.imgAtom,
              height: 250,
            )),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle(
    BuildContext context,
    String title,
    dynamic subtitle,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: RichText(
        text: TextSpan(
          text: '$title: ',
          style: Theme.of(context).textTheme.headline5,
          children: [
            TextSpan(
              text: subtitle != null
                  ? '$subtitle'
                  : ChemSolutionLocalizations.of(context).nd,
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
