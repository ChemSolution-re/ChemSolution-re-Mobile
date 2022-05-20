import 'package:injectable/injectable.dart';

import '../api/chem_solution_api_client.dart';
import '../models/materials/material.dart';
import 'base_service.dart';

@injectable
class ProfileService extends BaseService {
  final ChemSolutionApiClient _apiClient;

  ProfileService(this._apiClient);

  Future<List<ChemMaterial>> getMaterials() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getMaterials();
    });
  }
}
