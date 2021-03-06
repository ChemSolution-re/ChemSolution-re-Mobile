import 'package:injectable/injectable.dart';

import '../api/chem_solution_api_client.dart';
import '../models/materials/achievement.dart';
import '../models/materials/material.dart';
import '../models/requests/chem_request.dart';
import '../models/user.dart';
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

  Future<List<Achievement>> getAchievements() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getAchievements();
    });
  }

  Future<List<ChemRequest>> getRequests() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getRequests();
    });
  }

  Future<User> getInfo() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getInfo();
    });
  }
}
