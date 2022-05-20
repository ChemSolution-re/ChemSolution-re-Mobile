import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/handled_error.dart';
import '../../../models/requests/chem_request.dart';
import '../../../services/profile_service.dart';
import '../../base_cubit.dart';

part 'requests_page_state.dart';

@injectable
class RequestsPageCubit extends BaseCubit<RequestsPageState> {
  final ProfileService _profileService;

  RequestsPageCubit(
    this._profileService,
  ) : super(const RequestsPageState()) {
    loadRequests();
  }

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: RequestsPageStatus.error,
    ));
  }

  void changeSearching() {
    emit(state.copyWith(
      isSearching: !state.isSearching,
      selectedRequests: state.allRequests,
    ));
  }

  Future<void> loadRequests() async {
    emit(state.copyWith(status: RequestsPageStatus.loading));
    await makeErrorHandledCall(() async {
      final materils = await _profileService.getRequests();
      emit(state.copyWith(
        allRequests: materils,
        selectedRequests: materils,
        status: RequestsPageStatus.success,
      ));
    });
  }

  void filter(String? value) {
    final searched = (value ?? '').toLowerCase();
    final requests = state.allRequests.where((request) {
      return request.text.toLowerCase().contains(searched) ||
          request.theme.toLowerCase().contains(searched);
    }).toList();
    emit(state.copyWith(selectedRequests: requests));
  }
}
