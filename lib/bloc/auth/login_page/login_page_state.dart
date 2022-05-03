part of 'login_page_cubit.dart';

enum LoginPageStatus {
  initial,
  loading,
  success,
  error,
}

class LoginPageState extends Equatable {
  final LoginPageStatus status;
  final HandledError error;
  final bool obscureText;

  const LoginPageState({
    this.status = LoginPageStatus.initial,
    this.error = const HandledError.empty(),
    this.obscureText = true,
  });

  LoginPageState copyWith({
    LoginPageStatus? status,
    HandledError? error,
    bool? obscureText,
  }) {
    return LoginPageState(
      status: status ?? this.status,
      error: error ?? this.error,
      obscureText: obscureText ?? this.obscureText,
    );
  }

  @override
  List<Object> get props => [status, error, obscureText];
}
