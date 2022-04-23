part of 'cribs_tab_cubit.dart';

enum CribsTabStatus {
  loading,
  error,
  success,
}

class CribsTabState extends Equatable {
  final CribsTabStatus status;
  final List<BlogPost> posts;
  final HandledError error;
  final bool isSearching;

  const CribsTabState({
    this.status = CribsTabStatus.loading,
    this.posts = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  CribsTabState copyWith({
    CribsTabStatus? status,
    List<BlogPost>? posts,
    HandledError? error,
    bool? isSearching,
  }) {
    return CribsTabState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      error: error ?? this.error,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object> get props => [status, posts, error, isSearching];
}
