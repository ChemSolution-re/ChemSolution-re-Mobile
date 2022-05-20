import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/handled_error.dart';
import '../../../models/user.dart';
import '../../../services/profile_service.dart';
import '../../base_cubit.dart';

part 'profile_page_state.dart';

@injectable
class ProfilePageCubit extends BaseCubit<ProfilePageState> {
  final ProfileService _profileService;

  ProfilePageCubit(this._profileService)
      : super(ProfilePageState(user: User.empty())) {
    getInfo();
  }

  get loadProfile => null;

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      status: ProfilePageStatus.error,
      error: error,
    ));
  }

  Future<void> getInfo() async {
    emit(state.copyWith(status: ProfilePageStatus.loading));

    await makeErrorHandledCall(() async {
      emit(state.copyWith(
        status: ProfilePageStatus.success,
        user: await _profileService.getInfo(),
      ));
    });
  }
}
