import 'package:injectable/injectable.dart';

import '../../di/locator.dart';
import '../navigation_service.dart';
import '../preferences_service.dart';

@injectable
class LogoutService {
  final preferencesService = locator<PreferencesService>();
  final navigationService = locator<NavigationService>();

  Future<void> logout() async {
    await preferencesService.logout();
    await navigationService.navigateToLogin();
  }
}
