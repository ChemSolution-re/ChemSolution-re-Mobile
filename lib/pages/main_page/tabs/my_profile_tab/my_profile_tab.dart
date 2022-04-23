import 'package:flutter/material.dart';

import '../../../../views/chem_solution_app_bar.dart';
import 'views/unauthorized_view.dart';

class MyProfileTab extends StatefulWidget {
  static Widget create() {
    return const MyProfileTab._();
  }

  const MyProfileTab._({Key? key}) : super(key: key);

  @override
  State<MyProfileTab> createState() => _MyProfileTabState();
}

class _MyProfileTabState extends State<MyProfileTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChemSolutionAppBar(
        isLeadingIconEnabled: false,
      ),
      body: UnautorizedView(),
    );
  }
}
