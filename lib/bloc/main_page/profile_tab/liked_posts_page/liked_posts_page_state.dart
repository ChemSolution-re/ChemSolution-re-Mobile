part of 'liked_posts_page_cubit.dart';

enum NewsAndFactsTabStatus {
  loading,
  error,
  success,
}

class LikedPostsPageState extends Equatable {
  final NewsAndFactsTabStatus status;
  final List<BlogPost> allPosts;
  final List<BlogPost> selectedPosts;
  final HandledError error;
  final bool isSearching;

  const LikedPostsPageState({
    this.status = NewsAndFactsTabStatus.loading,
    this.allPosts = const [],
    this.selectedPosts = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  LikedPostsPageState copyWith({
    NewsAndFactsTabStatus? status,
    List<BlogPost>? allPosts,
    List<BlogPost>? selectedPosts,
    HandledError? error,
    bool? isSearching,
  }) {
    return LikedPostsPageState(
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
