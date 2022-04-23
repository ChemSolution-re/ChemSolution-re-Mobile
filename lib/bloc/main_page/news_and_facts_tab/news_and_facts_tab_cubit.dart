import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/blog_post/blog_post.dart';
import '../../../models/blog_post/blog_post_category.dart';
import '../../../models/handled_error.dart';
import '../../../services/blog_posts_service.dart';
import '../../base_cubit.dart';

part 'news_and_facts_tab_state.dart';

@injectable
class NewsAndFactsCubit extends BaseCubit<NewsAndFactsState> {
  final BlogPostsService _blogPostsService;

  NewsAndFactsCubit(
    this._blogPostsService,
  ) : super(const NewsAndFactsState());

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: NewsAndFactsStatus.error,
    ));
  }

  Future<void> loadPosts() async {
    emit(state.copyWith(status: NewsAndFactsStatus.loading));
    await makeErrorHandledCall(() async {
      final posts = await _blogPostsService.getBlogPostsByCategory(
        BlogPostCategory.news,
      );
      emit(state.copyWith(
        posts: posts,
        status: NewsAndFactsStatus.success,
      ));
    });
  }
}
