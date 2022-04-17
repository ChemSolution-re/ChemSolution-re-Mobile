import 'dart:core';

import 'package:injectable/injectable.dart';

import 'di.config.dart';
import 'locator.dart';

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  $configureDependencies(locator);
}
