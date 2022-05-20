// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chem_solution_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ChemSolutionApiClient implements ChemSolutionApiClient {
  _ChemSolutionApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://chemsolution-re-api-v2.azurewebsites.net/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<ChemElement>> getAllElements() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ChemElement>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/Elements',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ChemElement.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<BlogPost>> getBlogPostsByCategory(category) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<BlogPost>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/BlogPosts/all/$category',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => BlogPost.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<BlogPostInfo> getBlogPostInfo(blogPostId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BlogPostInfo>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/BlogPosts/$blogPostId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BlogPostInfo.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<BlogPost>> getLikedBlogPost() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<BlogPost>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/BlogPosts/allLiked',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => BlogPost.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<void> likePost(blogPostId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/BlogPosts/liked/add/$blogPostId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> dislikePost(blogPostId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/BlogPosts/liked/remove/$blogPostId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<LoginResponse> login(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/Auth/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> register(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/Auth/register',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> forgotPassword(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/Auth/forgot-password',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<List<ChemMaterial>> getMaterials() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ChemMaterial>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/Materials/OwnMaterials',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ChemMaterial.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Achievement>> getAchievements() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Achievement>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/Achievements/OwnAchievements',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Achievement.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ChemRequest>> getRequests() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ChemRequest>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/Requests/OwnRequests',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ChemRequest.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
