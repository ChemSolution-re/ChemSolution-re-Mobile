import 'package:injectable/injectable.dart';

import '../../di/locator.dart';
import '../preferences_service.dart';

@injectable
class LogoutService {
  final preferencesService = locator<PreferencesService>();

  Future<void> logout() async {
    await preferencesService.logout();
  }
}
