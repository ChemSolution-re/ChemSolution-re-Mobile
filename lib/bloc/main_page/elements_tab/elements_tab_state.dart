part of 'elements_tab_cubit.dart';

enum ElementTabStatus {
  error,
  loading,
  success,
}

class ElementTabState extends Equatable {
  final ElementTabStatus status;
  final List<ChemElement> elements;
  final HandledError error;
  final bool isSearching;

  const ElementTabState({
    this.status = ElementTabStatus.loading,
    this.elements = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  ElementTabState copyWith({
    ElementTabStatus? status,
    List<ChemElement>? elements,
    HandledError? error,
    bool? isSearching,
  }) {
    return ElementTabState(
      status: status ?? this.status,
      elements: elements ?? this.elements,
      error: error ?? this.error,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object> get props => [
        status,
        elements,
        error,
        isSearching,
      ];
}
