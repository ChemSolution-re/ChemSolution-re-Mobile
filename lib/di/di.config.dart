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
    as _i16;
import '../bloc/auth/login_page/login_page_cubit.dart' as _i18;
import '../bloc/auth/register_page/register_page_cubit.dart' as _i22;
import '../bloc/blog_post_page/blog_post_page_cubit.dart' as _i23;
import '../bloc/main_page/cribs_tab/cribs_tab_cubit.dart' as _i15;
import '../bloc/main_page/elements_tab/elements_tab_cubit.dart' as _i9;
import '../bloc/main_page/news_and_facts_tab/news_and_facts_tab_cubit.dart'
    as _i20;
import '../bloc/profile/achievement_page/achievement_page_cubit.dart' as _i12;
import '../bloc/profile/liked_posts_page/liked_posts_page_cubit.dart' as _i17;
import '../bloc/profile/materials_page/materials_page_cubit.dart' as _i19;
import '../bloc/profile/profile_page/profile_page_cubit.dart' as _i21;
import '../bloc/profile/requests_page/requests_page_cubit.dart' as _i11;
import '../models/blog_post/blog_post.dart' as _i24;
import '../services/auth_service.dart' as _i13;
import '../services/blog_posts_service.dart' as _i14;
import '../services/elements_service.dart' as _i8;
import '../services/preferences_service.dart' as _i3;
import '../services/profile_service.dart' as _i10;
import 'modules/api_module.dart'
    as _i25; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i10.ProfileService>(
      () => _i10.ProfileService(get<_i7.ChemSolutionApiClient>()));
  gh.factory<_i11.RequestsPageCubit>(
      () => _i11.RequestsPageCubit(get<_i10.ProfileService>()));
  gh.factory<_i12.AchievementsPageCubit>(
      () => _i12.AchievementsPageCubit(get<_i10.ProfileService>()));
  gh.factory<_i13.AuthService>(
      () => _i13.AuthService(get<_i7.ChemSolutionApiClient>()));
  gh.factory<_i14.BlogPostsService>(
      () => _i14.BlogPostsService(get<_i7.ChemSolutionApiClient>()));
  gh.factory<_i15.CribsTabCubit>(
      () => _i15.CribsTabCubit(get<_i14.BlogPostsService>()));
  gh.factory<_i16.ForgetPasswordPageCubit>(
      () => _i16.ForgetPasswordPageCubit(get<_i13.AuthService>()));
  gh.factory<_i17.LikedPostsPageCubit>(
      () => _i17.LikedPostsPageCubit(get<_i14.BlogPostsService>()));
  gh.factory<_i18.LoginPageCubit>(() => _i18.LoginPageCubit(
      get<_i13.AuthService>(), get<_i3.PreferencesService>()));
  gh.factory<_i19.MaterialsPageCubit>(
      () => _i19.MaterialsPageCubit(get<_i10.ProfileService>()));
  gh.factory<_i20.NewsAndFactsTabCubit>(
      () => _i20.NewsAndFactsTabCubit(get<_i14.BlogPostsService>()));
  gh.factory<_i21.ProfilePageCubit>(
      () => _i21.ProfilePageCubit(get<_i10.ProfileService>()));
  gh.factory<_i22.RegisterPageCubit>(
      () => _i22.RegisterPageCubit(get<_i13.AuthService>()));
  gh.factoryParam<_i23.BlogPostPageCubit, _i24.BlogPost?, dynamic>(
      (blogPost, _) =>
          _i23.BlogPostPageCubit(get<_i14.BlogPostsService>(), blogPost));
  return get;
}

class _$ApiModule extends _i25.ApiModule {}
