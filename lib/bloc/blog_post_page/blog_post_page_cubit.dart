import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../models/blog_post/blog_post.dart';
import '../../models/blog_post/blog_post_info.dart';
import '../../models/handled_error.dart';
import '../../services/blog_posts_service.dart';
import '../base_cubit.dart';

part 'blog_post_page_state.dart';

@injectable
class BlogPostPageCubit extends BaseCubit<BlogPostPageState> {
  final BlogPostsService _blogPostsService;

  BlogPostPageCubit(
    this._blogPostsService,
    BlogPost? blogPost,
  ) : super(BlogPostPageState(
          blogPost: blogPost!,
        ));

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: BlogPostPageStatus.errorLike,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: BlogPostPageStatus.loading));
    try {
      final info = await _blogPostsService.getBlogPostInfo(state.blogPost);
      emit(state.copyWith(
        info: info,
        status: BlogPostPageStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: BlogPostPageStatus.error));
    }
  }

  Future<void> like() async {
    emit(state.copyWith(status: BlogPostPageStatus.loadingLike));
    await makeErrorHandledCall(() async {
      await _blogPostsService.likePost(state.blogPost);
      final info = await _blogPostsService.getBlogPostInfo(state.blogPost);
      emit(state.copyWith(
        info: info,
        status: BlogPostPageStatus.success,
      ));
    });
  }

  Future<void> dislike() async {
    emit(state.copyWith(status: BlogPostPageStatus.loadingLike));
    await makeErrorHandledCall(() async {
      await _blogPostsService.dislikePost(state.blogPost);
      final info = await _blogPostsService.getBlogPostInfo(state.blogPost);
      emit(state.copyWith(
        info: info,
        status: BlogPostPageStatus.success,
      ));
    });
  }
}
