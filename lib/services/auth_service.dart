import 'package:injectable/injectable.dart';

import '../api/chem_solution_api_client.dart';
import '../api/models/forget_password_request.dart';
import '../api/models/login_request.dart';
import '../api/models/login_response.dart';
import '../api/models/register_request.dart';
import 'base_service.dart';

@injectable
class AuthService extends BaseService {
  final ChemSolutionApiClient _apiClient;

  AuthService(this._apiClient);

  Future<LoginResponse> login(
    LoginRequest body,
  ) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.login(body);
    });
  }

  Future<void> register(
    RegisterRequest body,
  ) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.register(body);
    });
  }

  Future<void> forgotPassword(String email) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.forgotPassword(
        ForgetPasswordRequest(email: email),
      );
    });
  }
}
