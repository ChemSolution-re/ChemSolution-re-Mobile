import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/element.dart';
import 'api_constants.dart';

part 'chem_solution_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ChemSolutionApiClient {
  factory ChemSolutionApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ChemSolutionApiClient;

  ///
  /// Elements
  ///

  @GET('/Elements')
  Future<List<Element>> getAllElements();
}
