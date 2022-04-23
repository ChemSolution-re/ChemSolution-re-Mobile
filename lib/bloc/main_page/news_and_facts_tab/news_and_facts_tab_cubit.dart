import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/blog_post/blog_post.dart';
import '../../../models/blog_post/blog_post_category.dart';
import '../../../models/handled_error.dart';
import '../../../services/blog_posts_service.dart';
import '../../base_cubit.dart';

part 'news_and_facts_tab_state.dart';

@injectable
class NewsAndFactsTabCubit extends BaseCubit<NewsAndFactsTabState> {
  final BlogPostsService _blogPostsService;

  NewsAndFactsTabCubit(
    this._blogPostsService,
  ) : super(const NewsAndFactsTabState());

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: NewsAndFactsTabStatus.error,
    ));
  }

  void changeSearching() {
    emit(state.copyWith(
      isSearching: !state.isSearching,
    ));
  }

  Future<void> loadPosts() async {
    emit(state.copyWith(status: NewsAndFactsTabStatus.loading));
    await makeErrorHandledCall(() async {
      final posts = await _blogPostsService.getBlogPostsByCategory(
        BlogPostCategory.news,
      );
      emit(state.copyWith(
        posts: posts,
        status: NewsAndFactsTabStatus.success,
      ));
    });
  }
}
