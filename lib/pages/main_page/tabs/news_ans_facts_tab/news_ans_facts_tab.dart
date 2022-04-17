import 'package:flutter/material.dart';

import '../../../../views/chem_solution_app_bar.dart';

class NewsAndFactsTab extends StatefulWidget {
  static Widget create() {
    return NewsAndFactsTab._();
  }

  const NewsAndFactsTab._({Key? key}) : super(key: key);

  @override
  State<NewsAndFactsTab> createState() => _NewsAndFactsTabState();
}

class _NewsAndFactsTabState extends State<NewsAndFactsTab> {
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
