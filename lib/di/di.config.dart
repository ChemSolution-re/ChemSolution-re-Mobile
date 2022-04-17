// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/chem_solution_api_client.dart' as _i8;
import '../api/interceptors/header_api_interceptor.dart' as _i6;
import '../services/auth/logout_service.dart' as _i3;
import '../services/navigation_service.dart' as _i4;
import '../services/preferences_service.dart' as _i5;
import 'modules/api_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.factory<_i3.LogoutService>(() => _i3.LogoutService());
  gh.singleton<_i4.NavigationService>(_i4.NavigationService());
  await gh.factoryAsync<_i5.PreferencesService>(
      () => _i5.PreferencesService.getInstance(),
      preResolve: true);
  gh.factory<_i6.HeaderApiInterceptor>(() => _i6.HeaderApiInterceptor(
      get<_i5.PreferencesService>(), get<_i3.LogoutService>()));
  gh.lazySingleton<_i7.Dio>(
      () => apiModule.dio(get<_i6.HeaderApiInterceptor>()));
  gh.lazySingleton<_i8.ChemSolutionApiClient>(
      () => apiModule.apiClient(get<_i7.Dio>()));
  return get;
}

class _$ApiModule extends _i9.ApiModule {}
