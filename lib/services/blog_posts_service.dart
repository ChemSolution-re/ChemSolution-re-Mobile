import 'package:injectable/injectable.dart';

import '../api/chem_solution_api_client.dart';
import '../models/blog_post/blog_post.dart';
import '../models/blog_post/blog_post_category.dart';
import '../models/blog_post/blog_post_info.dart';
import 'base_service.dart';

@injectable
class BlogPostsService extends BaseService {
  final ChemSolutionApiClient _apiClient;

  BlogPostsService(this._apiClient);

  Future<List<BlogPost>> getBlogPostsByCategory(
    BlogPostCategory category,
  ) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getBlogPostsByCategory(
        category.toJson(),
      );
    });
  }

  Future<List<BlogPost>> getLikedBlogPost() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getLikedBlogPost();
    });
  }

  Future<BlogPostInfo> getBlogPostInfo(BlogPost post) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getBlogPostInfo(post.blogPostId);
    });
  }

  Future<void> likePost(BlogPost post) async {
    await makeErrorParsedCall(() async {
      await _apiClient.likePost(post.blogPostId);
    });
  }

  Future<void> dislikePost(BlogPost post) async {
    await makeErrorParsedCall(() async {
      await _apiClient.dislikePost(post.blogPostId);
    });
  }
}
