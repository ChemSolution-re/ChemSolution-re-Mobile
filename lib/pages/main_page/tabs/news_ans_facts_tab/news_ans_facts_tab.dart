import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/main_page/news_and_facts_tab/news_and_facts_tab_cubit.dart';
import '../../../../di/locator.dart';
import '../../../../utils/chem_solution_toasts.dart';
import '../../../../views/animated_logo.dart';
import '../../../../views/blog_post_tile.dart';
import '../../../../views/chem_solution_app_bar.dart';
import '../../../../views/error_view.dart';

class NewsAndFactsTab extends StatefulWidget {
  static Widget create() {
    return BlocProvider(
      create: (_) => locator<NewsAndFactsTabCubit>(),
      child: const NewsAndFactsTab._(),
    );
  }

  const NewsAndFactsTab._({Key? key}) : super(key: key);

  @override
  State<NewsAndFactsTab> createState() => _NewsAndFactsTabState();
}

class _NewsAndFactsTabState extends State<NewsAndFactsTab> {
  NewsAndFactsTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    NewsAndFactsTabState state,
  ) {
    if (state.status == NewsAndFactsTabStatus.error) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAndFactsTabCubit, NewsAndFactsTabState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return Scaffold(
          appBar: ChemSolutionAppBar(
            isLeadingIconEnabled: false,
            isSearching: state.isSearching,
            onSearchIconPressed: cubit.changeSearching,
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(NewsAndFactsTabState state) {
    switch (state.status) {
      case NewsAndFactsTabStatus.loading:
        return const Center(child: AnimatedLogo());
      case NewsAndFactsTabStatus.error:
        return ErrorView(onPressed: cubit.loadPosts);
      case NewsAndFactsTabStatus.success:
        return ListView.builder(
          itemBuilder: (_, index) {
            return BlogPostTile(post: state.posts[index]);
          },
          itemCount: state.posts.length,
        );
    }
  }
}
