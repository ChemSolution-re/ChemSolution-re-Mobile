part of 'news_and_facts_tab_cubit.dart';

enum NewsAndFactsStatus {
  loading,
  error,
  success,
}

class NewsAndFactsState extends Equatable {
  final NewsAndFactsStatus status;
  final List<BlogPost> posts;
  final HandledError error;
  final bool isSearching;

  const NewsAndFactsState({
    this.status = NewsAndFactsStatus.loading,
    this.posts = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  NewsAndFactsState copyWith({
    NewsAndFactsStatus? status,
    List<BlogPost>? posts,
    HandledError? error,
    bool? isSearching,
  }) {
    return NewsAndFactsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      error: error ?? this.error,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object> get props => [status, posts, error, isSearching];
}
