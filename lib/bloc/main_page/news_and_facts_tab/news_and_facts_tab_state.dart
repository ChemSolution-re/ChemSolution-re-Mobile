part of 'news_and_facts_tab_cubit.dart';

enum NewsAndFactsTabStatus {
  loading,
  error,
  success,
}

class NewsAndFactsTabState extends Equatable {
  final NewsAndFactsTabStatus status;
  final List<BlogPost> allPosts;
  final List<BlogPost> selectedPosts;
  final HandledError error;
  final bool isSearching;

  const NewsAndFactsTabState({
    this.status = NewsAndFactsTabStatus.loading,
    this.allPosts = const [],
    this.selectedPosts = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  NewsAndFactsTabState copyWith({
    NewsAndFactsTabStatus? status,
    List<BlogPost>? allPosts,
    List<BlogPost>? selectedPosts,
    HandledError? error,
    bool? isSearching,
  }) {
    return NewsAndFactsTabState(
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
