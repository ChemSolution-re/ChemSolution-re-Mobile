// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/chem_solution_api_client.dart' as _i7;
import '../api/interceptors/header_api_interceptor.dart' as _i5;
import '../bloc/app_control/app_control_cubit.dart' as _i4;
import '../bloc/auth/forget_password_page/forget_password_page_cubit.dart'
    as _i13;
import '../bloc/auth/login_page/login_page_cubit.dart' as _i14;
import '../bloc/blog_post_page/blog_post_page_cubit.dart' as _i16;
import '../bloc/main_page/cribs_tab/cribs_tab_cubit.dart' as _i12;
import '../bloc/main_page/elements_tab/elements_tab_cubit.dart' as _i9;
import '../bloc/main_page/news_and_facts_tab/news_and_facts_tab_cubit.dart'
    as _i15;
import '../models/blog_post/blog_post.dart' as _i17;
import '../services/auth_service.dart' as _i10;
import '../services/blog_posts_service.dart' as _i11;
import '../services/elements_service.dart' as _i8;
import '../services/preferences_service.dart' as _i3;
import 'modules/api_module.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  await gh.factoryAsync<_i3.PreferencesService>(
      () => _i3.PreferencesService.getInstance(),
      preResolve: true);
  gh.factoryParam<_i4.AppControlCubit, _i4.AppControlState?, dynamic>(
      (initialState, _) =>
          _i4.AppControlCubit(get<_i3.PreferencesService>(), initialState));
  gh.factory<_i5.HeaderApiInterceptor>(
      () => _i5.HeaderApiInterceptor(get<_i3.PreferencesService>()));
  gh.lazySingleton<_i6.Dio>(
      () => apiModule.dio(get<_i5.HeaderApiInterceptor>()));
  gh.lazySingleton<_i7.ChemSolutionApiClient>(
      () => apiModule.apiClient(get<_i6.Dio>()));
  gh.factory<_i8.ElementsService>(
      () => _i8.ElementsService(get<_i7.ChemSolutionApiClient>()));
  gh.factory<_i9.ElementsTabCubit>(
      () => _i9.ElementsTabCubit(get<_i8.ElementsService>()));
  gh.factory<_i10.AuthService>(
      () => _i10.AuthService(get<_i7.ChemSolutionApiClient>()));
  gh.factory<_i11.BlogPostsService>(
      () => _i11.BlogPostsService(get<_i7.ChemSolutionApiClient>()));
  gh.factory<_i12.CribsTabCubit>(
      () => _i12.CribsTabCubit(get<_i11.BlogPostsService>()));
  gh.factory<_i13.ForgetPasswordPageCubit>(
      () => _i13.ForgetPasswordPageCubit(get<_i10.AuthService>()));
  gh.factory<_i14.LoginPageCubit>(() => _i14.LoginPageCubit(
      get<_i10.AuthService>(), get<_i3.PreferencesService>()));
  gh.factory<_i15.NewsAndFactsTabCubit>(
      () => _i15.NewsAndFactsTabCubit(get<_i11.BlogPostsService>()));
  gh.factoryParam<_i16.BlogPostPageCubit, _i17.BlogPost?, dynamic>(
      (blogPost, _) =>
          _i16.BlogPostPageCubit(get<_i11.BlogPostsService>(), blogPost));
  return get;
}

class _$ApiModule extends _i18.ApiModule {}
