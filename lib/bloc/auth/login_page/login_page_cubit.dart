import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../api/models/login_request.dart';
import '../../../models/handled_error.dart';
import '../../../services/auth_service.dart';
import '../../../services/preferences_service.dart';
import '../../base_cubit.dart';

part 'login_page_state.dart';

@injectable
class LoginPageCubit extends BaseCubit<LoginPageState> {
  final AuthService _authService;
  final PreferencesService _preferencesService;

  LoginPageCubit(
    this._authService,
    this._preferencesService,
  ) : super(const LoginPageState());

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: LoginPageStatus.error,
    ));
  }

  void changeObscureText() {
    emit(state.copyWith(
      obscureText: !state.obscureText,
      status: LoginPageStatus.initial,
    ));
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    emit(state.copyWith(status: LoginPageStatus.loading));
    await makeErrorHandledCall(() async {
      final auth = await _authService.login(LoginRequest(
        email: email,
        password: password,
      ));
      await _preferencesService.setAccessToken(auth.accessToken);
      emit(state.copyWith(status: LoginPageStatus.success));
    });
  }
}
