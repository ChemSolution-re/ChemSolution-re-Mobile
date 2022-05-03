part of 'register_page_cubit.dart';

enum RegisterPageStatus {
  initial,
  loading,
  success,
  error,
}

class RegisterPageState extends Equatable {
  final RegisterPageStatus status;
  final HandledError error;
  final bool obscureText;

  const RegisterPageState({
    this.status = RegisterPageStatus.initial,
    this.error = const HandledError.empty(),
    this.obscureText = true,
  });

  RegisterPageState copyWith({
    RegisterPageStatus? status,
    HandledError? error,
    bool? obscureText,
  }) {
    return RegisterPageState(
      status: status ?? this.status,
      error: error ?? this.error,
      obscureText: obscureText ?? this.obscureText,
    );
  }

  @override
  List<Object> get props => [status, error, obscureText];
}
