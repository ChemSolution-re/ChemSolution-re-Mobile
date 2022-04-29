import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/blog_post/blog_post.dart';
import '../models/blog_post/blog_post_info.dart';
import '../models/elements/chem_element.dart';
import 'api_constants.dart';

part 'chem_solution_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ChemSolutionApiClient {
  factory ChemSolutionApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ChemSolutionApiClient;

  ///
  /// Elements
  ///

  @GET('/Elements')
  Future<List<ChemElement>> getAllElements();

  ///
  /// BlocPosts
  ///

  @GET('/BlogPosts/all/{blogPostCategory}')
  Future<List<BlogPost>> getBlogPostsByCategory(
    @Path('blogPostCategory') String category,
  );

  @POST('/BlogPosts/{id}')
  Future<BlogPostInfo> getBlogPostInfo(
    @Path('id') String blogPostId,
  );

  @POST('/BlogPosts/liked/add/{postId}')
  Future<void> likePost(
    @Path('postId') String blogPostId,
  );

  @POST('/BlogPosts/liked/remove/{postId}')
  Future<void> dislikePost(
    @Path('postId') String blogPostId,
  );
}
