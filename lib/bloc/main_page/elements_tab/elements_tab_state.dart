part of 'elements_tab_cubit.dart';

enum ElementTabStatus {
  error,
  loading,
  success,
}

class ElementsTabState extends Equatable {
  final ElementTabStatus status;
  final List<ChemElement> allElements;
  final List<ChemElement> selectedElements;
  final HandledError error;
  final bool isSearching;

  const ElementsTabState({
    this.status = ElementTabStatus.loading,
    this.allElements = const [],
    this.selectedElements = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  ElementsTabState copyWith({
    ElementTabStatus? status,
    List<ChemElement>? allElements,
    List<ChemElement>? selectedElements,
    HandledError? error,
    bool? isSearching,
  }) {
    return ElementsTabState(
      status: status ?? this.status,
      allElements: allElements ?? this.allElements,
      selectedElements: selectedElements ?? this.selectedElements,
      error: error ?? this.error,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      allElements,
      selectedElements,
      error,
      isSearching,
    ];
  }
}
