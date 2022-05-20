import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/handled_error.dart';
import '../../../models/materials/achievement.dart';
import '../../../services/profile_service.dart';
import '../../base_cubit.dart';

part 'achievement_page_state.dart';

@injectable
class AchievementsPageCubit extends BaseCubit<AchievementsPageState> {
  final ProfileService _profileService;

  AchievementsPageCubit(
    this._profileService,
  ) : super(const AchievementsPageState()) {
    loadAchievements();
  }

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: AchievementsPageStatus.error,
    ));
  }

  void changeSearching() {
    emit(state.copyWith(
      isSearching: !state.isSearching,
      selectedAchievements: state.allAchievements,
    ));
  }

  Future<void> loadAchievements() async {
    emit(state.copyWith(status: AchievementsPageStatus.loading));
    await makeErrorHandledCall(() async {
      final materils = await _profileService.getAchievements();
      emit(state.copyWith(
        allAchievements: materils,
        selectedAchievements: materils,
        status: AchievementsPageStatus.success,
      ));
    });
  }

  void filter(String? value) {
    final searched = (value ?? '').toLowerCase();
    final achievements = state.allAchievements.where((achievement) {
      return achievement.heading.toLowerCase().contains(searched) ||
          achievement.description.toLowerCase().contains(searched);
    }).toList();
    emit(state.copyWith(selectedAchievements: achievements));
  }
}
