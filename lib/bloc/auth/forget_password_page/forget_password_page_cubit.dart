import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/handled_error.dart';
import '../../../services/auth_service.dart';
import '../../base_cubit.dart';

part 'forget_password_page_state.dart';

@injectable
class ForgetPasswordPageCubit extends BaseCubit<ForgetPasswordPageState> {
  final AuthService _authService;

  ForgetPasswordPageCubit(
    this._authService,
  ) : super(const ForgetPasswordPageState());

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: ForgetPasswordPageStatus.error,
    ));
  }

  Future<void> restore(
    String email,
  ) async {
    emit(state.copyWith(status: ForgetPasswordPageStatus.loading));
    await makeErrorHandledCall(() async {
      await _authService.forgotPassword(email);
      emit(state.copyWith(status: ForgetPasswordPageStatus.success));
    });
  }
}
