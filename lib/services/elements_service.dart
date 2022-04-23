import 'package:injectable/injectable.dart';

import '../api/chem_solution_api_client.dart';
import '../models/elements/chem_element.dart';
import 'base_service.dart';

@injectable
class ElementsService extends BaseService {
  final ChemSolutionApiClient _apiClient;

  ElementsService(this._apiClient);

  Future<List<ChemElement>> getAllElements() async {
    return makeErrorParsedCall(() async {
      return await _apiClient.getAllElements();
    });
  }
}
