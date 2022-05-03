import 'package:flutter/material.dart';

import '../../../../di/locator.dart';
import '../../../../services/preferences_service.dart';
import '../../../../views/chem_solution_app_bar.dart';
import '../../../auth/login_page.dart';
import 'views/authorized_view.dart';
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
  bool get isLoggedIn => locator<PreferencesService>().isLoggedIn;

  Future<void> onAuth() async {
    await Navigator.of(context).push(LoginPage.getRoute());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChemSolutionAppBar(
        isLeadingIconEnabled: false,
      ),
      body: isLoggedIn
          ? const AuthorizedView()
          : UnautorizedView(
              onPressed: onAuth,
            ),
    );
  }
}
