import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/blog_post/blog_post.dart';
import '../../../models/blog_post/blog_post_category.dart';
import '../../../models/handled_error.dart';
import '../../../services/blog_posts_service.dart';
import '../../base_cubit.dart';

part 'cribs_tab_state.dart';

@injectable
class CribsTabCubit extends BaseCubit<CribsTabState> {
  final BlogPostsService _blogPostsService;

  CribsTabCubit(
    this._blogPostsService,
  ) : super(const CribsTabState()) {
    loadPosts();
  }

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: CribsTabStatus.error,
    ));
  }

  void changeSearching() {
    emit(state.copyWith(
      isSearching: !state.isSearching,
    ));
  }

  Future<void> loadPosts() async {
    emit(state.copyWith(status: CribsTabStatus.loading));
    await makeErrorHandledCall(() async {
      final posts = await _blogPostsService.getBlogPostsByCategory(
        BlogPostCategory.crib,
      );
      emit(state.copyWith(
        posts: posts,
        status: CribsTabStatus.success,
      ));
    });
  }
}
