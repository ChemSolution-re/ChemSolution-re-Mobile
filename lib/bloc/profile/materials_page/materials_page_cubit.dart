import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/handled_error.dart';
import '../../../models/materials/material.dart';
import '../../../services/profile_service.dart';
import '../../base_cubit.dart';

part 'materials_page_state.dart';

@injectable
class MaterialsPageCubit extends BaseCubit<MaterialsPageState> {
  final ProfileService _profileService;

  MaterialsPageCubit(
    this._profileService,
  ) : super(const MaterialsPageState()) {
    loadMaterials();
  }

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: MaterialsPageStatus.error,
    ));
  }

  void changeSearching() {
    emit(state.copyWith(
      isSearching: !state.isSearching,
      selectedMaterials: state.allMaterials,
    ));
  }

  Future<void> loadMaterials() async {
    emit(state.copyWith(status: MaterialsPageStatus.loading));
    await makeErrorHandledCall(() async {
      final materils = await _profileService.getMaterials();
      emit(state.copyWith(
        allMaterials: materils,
        selectedMaterials: materils,
        status: MaterialsPageStatus.success,
      ));
    });
  }

  void filter(String? value) {
    final searched = (value ?? '').toLowerCase();
    final materials = state.allMaterials.where((matrial) {
      return matrial.formula.toLowerCase().contains(searched) ||
          matrial.name.toLowerCase().contains(searched) ||
          matrial.info.toLowerCase().contains(searched);
    }).toList();
    emit(state.copyWith(selectedMaterials: materials));
  }
}
