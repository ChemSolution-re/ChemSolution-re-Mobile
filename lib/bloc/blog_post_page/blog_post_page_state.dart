part of 'blog_post_page_cubit.dart';

enum BlogPostPageStatus {
  loading,
  error,
  success,
  errorLike,
  loadingLike,
}

class BlogPostPageState extends Equatable {
  final BlogPostPageStatus status;
  final BlogPost blogPost;
  final BlogPostInfo info;
  final HandledError error;

  const BlogPostPageState({
    required this.blogPost,
    this.status = BlogPostPageStatus.loading,
    this.info = const BlogPostInfo.empty(),
    this.error = const HandledError.empty(),
  });

  BlogPostPageState copyWith({
    BlogPostPageStatus? status,
    BlogPost? blogPost,
    BlogPostInfo? info,
    HandledError? error,
  }) {
    return BlogPostPageState(
      status: status ?? this.status,
      blogPost: blogPost ?? this.blogPost,
      info: info ?? this.info,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        status,
        blogPost,
        info,
        error,
      ];
}
