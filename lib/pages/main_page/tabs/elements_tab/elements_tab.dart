import 'package:flutter/material.dart';

import '../../../../views/chem_solution_app_bar.dart';

class ElementsTab extends StatefulWidget {
  static Widget create() {
    return ElementsTab._();
  }

  const ElementsTab._({Key? key}) : super(key: key);

  @override
  State<ElementsTab> createState() => _ElementsTabState();
}

class _ElementsTabState extends State<ElementsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChemSolutionAppBar(
        isLeadingIconEnabled: false,
        // isSearching: isSearching,
        // onSearchIconPressed: _onSearchIconPress,
      ),
    );
  }
}
