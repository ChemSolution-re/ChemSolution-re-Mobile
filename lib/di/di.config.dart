// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/chem_solution_api_client.dart' as _i8;
import '../api/interceptors/header_api_interceptor.dart' as _i6;
import '../bloc/app_control/app_control_cubit.dart' as _i5;
import '../bloc/auth/login_page/login_page_cubit.dart' as _i3;
import '../bloc/blog_post_page/blog_post_page_cubit.dart' as _i14;
import '../bloc/main_page/cribs_tab/cribs_tab_cubit.dart' as _i12;
import '../bloc/main_page/elements_tab/elements_tab_cubit.dart' as _i10;
import '../bloc/main_page/news_and_facts_tab/news_and_facts_tab_cubit.dart'
    as _i13;
import '../models/blog_post/blog_post.dart' as _i15;
import '../services/blog_posts_service.dart' as _i11;
import '../services/elements_service.dart' as _i9;
import '../services/preferences_service.dart' as _i4;
import 'modules/api_module.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.factory<_i3.LoginPageCubit>(() => _i3.LoginPageCubit());
  await gh.factoryAsync<_i4.PreferencesService>(
      () => _i4.PreferencesService.getInstance(),
      preResolve: true);
  gh.factoryParam<_i5.AppControlCubit, _i5.AppControlState?, dynamic>(
      (initialState, _) =>
          _i5.AppControlCubit(get<_i4.PreferencesService>(), initialState));
  gh.factory<_i6.HeaderApiInterceptor>(
      () => _i6.HeaderApiInterceptor(get<_i4.PreferencesService>()));
  gh.lazySingleton<_i7.Dio>(
      () => apiModule.dio(get<_i6.HeaderApiInterceptor>()));
  gh.lazySingleton<_i8.ChemSolutionApiClient>(
      () => apiModule.apiClient(get<_i7.Dio>()));
  gh.factory<_i9.ElementsService>(
      () => _i9.ElementsService(get<_i8.ChemSolutionApiClient>()));
  gh.factory<_i10.ElementsTabCubit>(
      () => _i10.ElementsTabCubit(get<_i9.ElementsService>()));
  gh.factory<_i11.BlogPostsService>(
      () => _i11.BlogPostsService(get<_i8.ChemSolutionApiClient>()));
  gh.factory<_i12.CribsTabCubit>(
      () => _i12.CribsTabCubit(get<_i11.BlogPostsService>()));
  gh.factory<_i13.NewsAndFactsTabCubit>(
      () => _i13.NewsAndFactsTabCubit(get<_i11.BlogPostsService>()));
  gh.factoryParam<_i14.BlogPostPageCubit, _i15.BlogPost?, dynamic>(
      (blogPost, _) =>
          _i14.BlogPostPageCubit(get<_i11.BlogPostsService>(), blogPost));
  return get;
}

class _$ApiModule extends _i16.ApiModule {}
