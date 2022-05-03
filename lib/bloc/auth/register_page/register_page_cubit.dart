import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../api/models/register_request.dart';
import '../../../models/handled_error.dart';
import '../../../services/auth_service.dart';
import '../../base_cubit.dart';

part 'register_page_state.dart';

@injectable
class RegisterPageCubit extends BaseCubit<RegisterPageState> {
  final AuthService _authService;

  RegisterPageCubit(
    this._authService,
  ) : super(const RegisterPageState());

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: RegisterPageStatus.error,
    ));
  }

  void changeObscureText() {
    emit(state.copyWith(
      obscureText: !state.obscureText,
      status: RegisterPageStatus.initial,
    ));
  }

  Future<void> register({
    required String userEmail,
    required String password,
    required String userName,
    required DateTime dateOfBirth,
  }) async {
    emit(state.copyWith(status: RegisterPageStatus.loading));
    await makeErrorHandledCall(() async {
      await _authService.register(
        RegisterRequest(
          userEmail: userEmail,
          userName: userName,
          password: password,
          dateOfBirth: dateOfBirth,
        ),
      );
      emit(state.copyWith(status: RegisterPageStatus.success));
    });
  }
}
