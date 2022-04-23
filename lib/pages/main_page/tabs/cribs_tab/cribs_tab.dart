import 'package:flutter/material.dart';

import '../../../../views/chem_solution_app_bar.dart';

class CribsTab extends StatefulWidget {
  static Widget create() {
    return const CribsTab._();
  }

  const CribsTab._({Key? key}) : super(key: key);

  @override
  State<CribsTab> createState() => _CribsTabState();
}

class _CribsTabState extends State<CribsTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChemSolutionAppBar(
        isLeadingIconEnabled: false,
        // isSearching: isSearching,
        // onSearchIconPressed: _onSearchIconPress,
      ),
    );
  }
}
