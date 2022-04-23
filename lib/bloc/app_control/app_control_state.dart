part of 'app_control_cubit.dart';

@immutable
class AppControlState extends Equatable {
  final Locale locale;
  final bool isLoggedIn;
  final HandledError error;

  const AppControlState({
    required this.locale,
    required this.isLoggedIn,
    this.error = const HandledError.empty(),
  });

  AppControlState copyWith({
    Locale? locale,
    bool? isLoggedIn,
    HandledError? error,
  }) {
    return AppControlState(
      locale: locale ?? this.locale,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props {
    return [
      locale,
      isLoggedIn,
      error,
    ];
  }
}
