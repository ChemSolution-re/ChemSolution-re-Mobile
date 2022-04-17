part of 'app_control_cubit.dart';

@immutable
class AppControlState extends Equatable {
  final Locale locale;
  final bool isLoggedIn;
  final String errorMessage;

  const AppControlState({
    required this.locale,
    required this.isLoggedIn,
    this.errorMessage = '',
  });

  AppControlState copyWith({
    Locale? locale,
    bool? isLoggedIn,
    String? errorMessage,
  }) {
    return AppControlState(
      locale: locale ?? this.locale,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props {
    return [
      locale,
      isLoggedIn,
      errorMessage,
    ];
  }
}
