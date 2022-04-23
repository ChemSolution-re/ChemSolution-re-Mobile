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
  Future<List<Element>> getAllElements() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Element>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/Elements',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Element.fromJson(i as Map<String, dynamic>))
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
