part of 'profile_page_cubit.dart';

enum ProfilePageStatus {
  loading,
  success,
  error,
}

class ProfilePageState extends Equatable {
  final ProfilePageStatus status;
  final HandledError error;
  final User user;

  const ProfilePageState({
    required this.user,
    this.status = ProfilePageStatus.loading,
    this.error = const HandledError.empty(),
  });

  ProfilePageState copyWith({
    ProfilePageStatus? status,
    HandledError? error,
    User? user,
  }) {
    return ProfilePageState(
      status: status ?? this.status,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, error, user];
}
