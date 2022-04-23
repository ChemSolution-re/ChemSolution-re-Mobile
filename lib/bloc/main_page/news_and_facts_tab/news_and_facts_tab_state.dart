part of 'news_and_facts_tab_cubit.dart';

enum NewsAndFactsTabStatus {
  loading,
  error,
  success,
}

class NewsAndFactsTabState extends Equatable {
  final NewsAndFactsTabStatus status;
  final List<BlogPost> posts;
  final HandledError error;
  final bool isSearching;

  const NewsAndFactsTabState({
    this.status = NewsAndFactsTabStatus.loading,
    this.posts = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  NewsAndFactsTabState copyWith({
    NewsAndFactsTabStatus? status,
    List<BlogPost>? posts,
    HandledError? error,
    bool? isSearching,
  }) {
    return NewsAndFactsTabState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      error: error ?? this.error,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object> get props => [status, posts, error, isSearching];
}
