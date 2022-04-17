import 'package:chem_solution/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'chem_solution_app.dart';
import 'di/di.dart';
import 'di/locator.dart';

void main() async {
  await Hive.initFlutter();

  await configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final prefs = locator<PreferencesService>();

  _setStatusBarColor(const Color(0xff2F455C));

  runApp(ChemSolutionApp.create(
    prefs.getLocale(),
    prefs.isLoggedIn,
  ));
}

void _setStatusBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
