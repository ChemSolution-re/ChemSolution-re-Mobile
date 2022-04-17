import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../services/auth/logout_service.dart';
import '../../services/preferences_service.dart';
import '../api_constants.dart';

@injectable
class HeaderApiInterceptor implements Interceptor {
  final PreferencesService _preferencesService;
  final LogoutService _logoutService;

  HeaderApiInterceptor(
    this._preferencesService,
    this._logoutService,
  );

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_shouldLogOut(err.response?.statusCode)) {
      _logoutService.logout();
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final languageCode = _preferencesService.getLocale().languageCode;
    final accessToken = _preferencesService.getAccessToken();

    options.headers['Accept-Language'] = languageCode;

    if (_preferencesService.isLoggedIn) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    final isInWhiteList = ApiConstants.endPointWhiteList
            .indexWhere((endPoint) => options.uri.path.contains(endPoint)) !=
        -1;

    if (accessToken.isEmpty && !isInWhiteList) {
      _logoutService.logout();
      return;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  bool _shouldLogOut(int? statusCode) {
    if (statusCode == null) return false;

    // TODO: Add statuses to the list
    const logOutStatuses = [];

    return logOutStatuses.contains(statusCode);
  }
}
