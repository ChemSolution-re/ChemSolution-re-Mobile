import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/blog_post/blog_post.dart';
import '../models/blog_post/blog_post_info.dart';
import '../models/elements/chem_element.dart';
import '../models/materials/achievement.dart';
import '../models/materials/material.dart';
import '../models/requests/chem_request.dart';
import '../models/user.dart';
import 'api_constants.dart';
import 'models/forget_password_request.dart';
import 'models/login_request.dart';
import 'models/login_response.dart';
import 'models/register_request.dart';

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

  @GET('/BlogPosts/{id}')
  Future<BlogPostInfo> getBlogPostInfo(
    @Path('id') String blogPostId,
  );

  @GET('/BlogPosts/allLiked')
  Future<List<BlogPost>> getLikedBlogPost();

  @POST('/BlogPosts/liked/add/{postId}')
  Future<void> likePost(
    @Path('postId') String blogPostId,
  );

  @POST('/BlogPosts/liked/remove/{postId}')
  Future<void> dislikePost(
    @Path('postId') String blogPostId,
  );

  ///
  /// Auth
  ///

  @POST('/Auth/login')
  Future<LoginResponse> login(
    @Body() LoginRequest body,
  );

  @POST('/Auth/register')
  Future<void> register(
    @Body() RegisterRequest body,
  );

  @POST('/Auth/forgot-password')
  Future<void> forgotPassword(
    @Body() ForgetPasswordRequest body,
  );

  ///
  /// Materials
  ///

  @GET('/Materials/OwnMaterials')
  Future<List<ChemMaterial>> getMaterials();

  ///
  /// Achievements
  ///

  @GET('/Achievements/OwnAchievements')
  Future<List<Achievement>> getAchievements();

  ///
  /// Requests
  ///

  @GET('/Requests/OwnRequests')
  Future<List<ChemRequest>> getRequests();

  ///
  /// User
  ///

  @GET('/Users')
  Future<User> getInfo();
}
