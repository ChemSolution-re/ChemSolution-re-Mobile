import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../bloc/blog_post_page/blog_post_page_cubit.dart';
import '../../di/locator.dart';
import '../../models/blog_post/blog_post.dart';
import '../../utils/chem_solution_toasts.dart';
import '../../views/animated_logo.dart';
import '../../views/chem_solution_app_bar.dart';
import '../../views/error_view.dart';

class BlogPostPage extends StatefulWidget {
  static PageRoute getRoute(BlogPost blogPost) {
    return SwipeablePageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => locator.get<BlogPostPageCubit>(param1: blogPost),
        child: const BlogPostPage(),
      );
    });
  }

  const BlogPostPage({Key? key}) : super(key: key);

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  BlogPostPageCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    BlogPostPageState state,
  ) {
    if (state.status == BlogPostPageStatus.errorLike) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChemSolutionAppBar(),
      body: _buildBody(),
      floatingActionButton: BlocBuilder<BlogPostPageCubit, BlogPostPageState>(
        builder: (context, state) {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: _buildFloatingIcon(state),
            onPressed: state.status == BlogPostPageStatus.loadingLike
                ? null
                : state.info.isLiked
                    ? cubit.dislike
                    : cubit.like,
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<BlogPostPageCubit, BlogPostPageState>(
      listener: _onStateChanged,
      builder: (context, state) {
        switch (state.status) {
          case BlogPostPageStatus.error:
            return ErrorView(onPressed: cubit.init);
          case BlogPostPageStatus.errorLike:
          case BlogPostPageStatus.success:
          case BlogPostPageStatus.loadingLike:
            return _buildSuccessBody(state);
          case BlogPostPageStatus.loading:
            return const Center(child: AnimatedLogo());
        }
      },
    );
  }

  Widget _buildSuccessBody(BlogPostPageState state) {
    return Column(
      children: [
        Image.network(state.blogPost.image),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                state.blogPost.title,
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 16),
              Text(
                state.info.information,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingIcon(BlogPostPageState state) {
    switch (state.status) {
      case BlogPostPageStatus.error:
      case BlogPostPageStatus.errorLike:
      case BlogPostPageStatus.success:
        return Icon(
          state.info.isLiked
              ? CommunityMaterialIcons.heart
              : CommunityMaterialIcons.heart_outline,
          color: Theme.of(context).colorScheme.secondary,
        );
      case BlogPostPageStatus.loadingLike:
      case BlogPostPageStatus.loading:
        return const AnimatedLogo();
    }
  }
}
