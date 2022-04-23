import 'package:injectable/injectable.dart';

import '../api/chem_solution_api_client.dart';
import '../models/blog_post/blog_post.dart';
import '../models/blog_post/blog_post_category.dart';
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
}
