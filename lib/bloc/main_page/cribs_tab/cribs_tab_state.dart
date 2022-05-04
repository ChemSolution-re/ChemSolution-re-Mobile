part of 'cribs_tab_cubit.dart';

enum CribsTabStatus {
  loading,
  error,
  success,
}

class CribsTabState extends Equatable {
  final CribsTabStatus status;
  final List<BlogPost> allPosts;
  final List<BlogPost> selectedPosts;
  final HandledError error;
  final bool isSearching;

  const CribsTabState({
    this.status = CribsTabStatus.loading,
    this.allPosts = const [],
    this.selectedPosts = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  CribsTabState copyWith({
    CribsTabStatus? status,
    List<BlogPost>? allPosts,
    List<BlogPost>? selectedPosts,
    HandledError? error,
    bool? isSearching,
  }) {
    return CribsTabState(
      status: status ?? this.status,
      allPosts: allPosts ?? this.allPosts,
      selectedPosts: selectedPosts ?? this.selectedPosts,
      error: error ?? this.error,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object> get props => [
        status,
        allPosts,
        error,
        isSearching,
        selectedPosts,
      ];
}
