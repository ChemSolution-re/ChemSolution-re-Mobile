import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../api/chem_solution_api_client.dart';
import '../../api/interceptors/header_api_interceptor.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio(HeaderApiInterceptor generalInterceptor) {
    return Dio()
      ..options.sendTimeout = 100
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true))
      ..interceptors.add(generalInterceptor);
  }

  @lazySingleton
  ChemSolutionApiClient apiClient(Dio dio) => ChemSolutionApiClient(dio);
}
