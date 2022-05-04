import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../bloc/main_page/news_and_facts_tab/news_and_facts_tab_cubit.dart';
import '../../../../di/locator.dart';
import '../../../../utils/chem_solution_toasts.dart';
import '../../../../views/animated_logo.dart';
import '../../../../views/blog_post_tile.dart';
import '../../../../views/chem_solution_app_bar.dart';
import '../../../../views/empty_view.dart';
import '../../../../views/error_view.dart';

enum NewsAndFactsTabFields { searching }

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
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

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
            searchingWidget: FormBuilder(
              key: _fbKey,
              child: FormBuilderTextField(
                name: NewsAndFactsTabFields.searching.name,
                autofocus: true,
                style: Theme.of(context).textTheme.headline6,
                onChanged: (_) {
                  _fbState?.save();
                  cubit.filter(_fbValue[NewsAndFactsTabFields.searching.name]);
                },
              ),
            ),
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
        return state.selectedPosts.isEmpty
            ? const EmptyView()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return BlogPostTile(post: state.selectedPosts[index]);
                },
                itemCount: state.selectedPosts.length,
              );
    }
  }
}
