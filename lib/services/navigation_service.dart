import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../utils/logging.dart';

@Singleton()
class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<dynamic> navigateToLogin() {
    // final future = navigatorKey.currentState?.pushReplacement(
    //     //TODO: Add page
    //     );

    // if (future == null) {
    //   Logging.error(
    //     className: 'NavigationService',
    //     message: 'navigateTo error',
    //     error: 'propable state is null',
    //   );
    //   return Future.value();
    // }

    // return future;
    return Future.value();
  }
}
