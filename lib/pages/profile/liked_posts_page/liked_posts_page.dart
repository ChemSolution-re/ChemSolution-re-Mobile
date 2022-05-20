import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../../../di/locator.dart';
import '../../../../utils/chem_solution_toasts.dart';
import '../../../../views/animated_logo.dart';
import '../../../../views/blog_post_tile.dart';
import '../../../../views/chem_solution_app_bar.dart';
import '../../../../views/empty_view.dart';
import '../../../../views/error_view.dart';
import '../../../bloc/main_page/profile_tab/liked_posts_page/liked_posts_page_cubit.dart';

enum LikedPostsPageFields { searching }

class LikedPostsPage extends StatefulWidget {
  static PageRoute getRoute() {
    return SwipeablePageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => locator<LikedPostsPageCubit>(),
        child: const LikedPostsPage._(),
      );
    });
  }

  const LikedPostsPage._({Key? key}) : super(key: key);

  @override
  State<LikedPostsPage> createState() => _LikedPostsPageState();
}

class _LikedPostsPageState extends State<LikedPostsPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  LikedPostsPageCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    LikedPostsPageState state,
  ) {
    if (state.status == LikedPostsPageStatus.error) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LikedPostsPageCubit, LikedPostsPageState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return Scaffold(
          appBar: ChemSolutionAppBar(
            isLeadingIconEnabled: false,
            isSearching: state.isSearching,
            onSearchIconPressed: cubit.changeSearching,
            searchingWidget: FormBuilder(
              key: _fbKey,
              child: FormBuilderTextField(
                name: LikedPostsPageFields.searching.name,
                autofocus: true,
                style: Theme.of(context).textTheme.headline6,
                onChanged: (_) {
                  _fbState?.save();
                  cubit.filter(_fbValue[LikedPostsPageFields.searching.name]);
                },
              ),
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(LikedPostsPageState state) {
    switch (state.status) {
      case LikedPostsPageStatus.loading:
        return const Center(child: AnimatedLogo());
      case LikedPostsPageStatus.error:
        return ErrorView(onPressed: cubit.loadPosts);
      case LikedPostsPageStatus.success:
        return state.selectedPosts.isEmpty
            ? const EmptyView()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return BlogPostTile(
                    post: state.selectedPosts[index],
                    onPressed: cubit.loadPosts,
                  );
                },
                itemCount: state.selectedPosts.length,
              );
    }
  }
}
