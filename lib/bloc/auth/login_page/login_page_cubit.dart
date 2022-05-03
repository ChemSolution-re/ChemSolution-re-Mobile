import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/handled_error.dart';
import '../../base_cubit.dart';

part 'login_page_state.dart';

@injectable
class LoginPageCubit extends BaseCubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState());

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
}
