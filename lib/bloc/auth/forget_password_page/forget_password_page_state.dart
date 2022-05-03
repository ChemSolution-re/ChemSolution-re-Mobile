part of 'forget_password_page_cubit.dart';

enum ForgetPasswordPageStatus {
  initial,
  loading,
  success,
  error,
}

class ForgetPasswordPageState extends Equatable {
  final ForgetPasswordPageStatus status;
  final HandledError error;

  const ForgetPasswordPageState({
    this.status = ForgetPasswordPageStatus.initial,
    this.error = const HandledError.empty(),
  });

  ForgetPasswordPageState copyWith({
    ForgetPasswordPageStatus? status,
    HandledError? error,
  }) {
    return ForgetPasswordPageState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        status,
        error,
      ];
}
