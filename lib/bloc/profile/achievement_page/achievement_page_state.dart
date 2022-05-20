part of 'achievement_page_cubit.dart';

enum AchievementsPageStatus {
  loading,
  error,
  success,
}

class AchievementsPageState extends Equatable {
  final AchievementsPageStatus status;
  final List<Achievement> allAchievements;
  final List<Achievement> selectedAchievements;
  final HandledError error;
  final bool isSearching;

  const AchievementsPageState({
    this.status = AchievementsPageStatus.loading,
    this.allAchievements = const [],
    this.selectedAchievements = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  @override
  List<Object> get props => [
        status,
        allAchievements,
        error,
        isSearching,
        selectedAchievements,
      ];

  AchievementsPageState copyWith({
    AchievementsPageStatus? status,
    List<Achievement>? allAchievements,
    List<Achievement>? selectedAchievements,
    HandledError? error,
    bool? isSearching,
  }) {
    return AchievementsPageState(
      status: status ?? this.status,
      allAchievements: allAchievements ?? this.allAchievements,
      selectedAchievements: selectedAchievements ?? this.selectedAchievements,
      error: error ?? this.error,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}
