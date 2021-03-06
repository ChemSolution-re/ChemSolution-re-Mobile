import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../bloc/main_page/cribs_tab/cribs_tab_cubit.dart';
import '../../../../di/locator.dart';
import '../../../../utils/chem_solution_toasts.dart';
import '../../../../views/animated_logo.dart';
import '../../../../views/blog_post_tile.dart';
import '../../../../views/chem_solution_app_bar.dart';
import '../../../../views/empty_view.dart';
import '../../../../views/error_view.dart';

enum CribsTabFields { searching }

class CribsTab extends StatefulWidget {
  static Widget create() {
    return BlocProvider(
      create: (_) => locator<CribsTabCubit>(),
      child: const CribsTab._(),
    );
  }

  const CribsTab._({Key? key}) : super(key: key);

  @override
  State<CribsTab> createState() => _CribsTabState();
}

class _CribsTabState extends State<CribsTab> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  CribsTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    CribsTabState state,
  ) {
    if (state.status == CribsTabStatus.error) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CribsTabCubit, CribsTabState>(
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
                name: CribsTabFields.searching.name,
                autofocus: true,
                style: Theme.of(context).textTheme.headline6,
                onChanged: (_) {
                  _fbState?.save();
                  cubit.filter(_fbValue[CribsTabFields.searching.name]);
                },
              ),
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(CribsTabState state) {
    switch (state.status) {
      case CribsTabStatus.loading:
        return const Center(child: AnimatedLogo());
      case CribsTabStatus.error:
        return ErrorView(onPressed: cubit.loadPosts);
      case CribsTabStatus.success:
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
