import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../services/preferences_service.dart';

@injectable
class HeaderApiInterceptor implements Interceptor {
  final PreferencesService _preferencesService;

  HeaderApiInterceptor(
    this._preferencesService,
  );

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final languageCode = _preferencesService.getLocale().languageCode;
    final accessToken = _preferencesService.getAccessToken();

    options.headers['Accept-Language'] = languageCode;

    if (_preferencesService.isLoggedIn) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
