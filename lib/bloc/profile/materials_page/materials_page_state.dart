part of 'materials_page_cubit.dart';

enum MaterialsPageStatus {
  loading,
  error,
  success,
}

class MaterialsPageState extends Equatable {
  final MaterialsPageStatus status;
  final List<ChemMaterial> allMaterials;
  final List<ChemMaterial> selectedMaterials;
  final HandledError error;
  final bool isSearching;

  const MaterialsPageState({
    this.status = MaterialsPageStatus.loading,
    this.allMaterials = const [],
    this.selectedMaterials = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  MaterialsPageState copyWith({
    MaterialsPageStatus? status,
    List<ChemMaterial>? allMaterials,
    List<ChemMaterial>? selectedMaterials,
    HandledError? error,
    bool? isSearching,
  }) {
    return MaterialsPageState(
      status: status ?? this.status,
      allMaterials: allMaterials ?? this.allMaterials,
      selectedMaterials: selectedMaterials ?? this.selectedMaterials,
      error: error ?? this.error,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object> get props => [
        status,
        allMaterials,
        error,
        isSearching,
        selectedMaterials,
      ];
}
