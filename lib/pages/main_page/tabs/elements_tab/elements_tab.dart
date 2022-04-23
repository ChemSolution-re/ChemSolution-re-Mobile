import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/main_page/elements_tab/elements_tab_cubit.dart';
import '../../../../di/locator.dart';
import '../../../../utils/chem_solution_toasts.dart';
import '../../../../views/animated_logo.dart';
import '../../../../views/chem_solution_app_bar.dart';
import '../../../../views/error_view.dart';
import 'views/element_tile.dart';

class ElementsTab extends StatefulWidget {
  static Widget create() {
    return BlocProvider(
      create: (_) => locator<ElementsTabCubit>(),
      child: const ElementsTab._(),
    );
  }

  const ElementsTab._({Key? key}) : super(key: key);

  @override
  State<ElementsTab> createState() => _ElementsTabState();
}

class _ElementsTabState extends State<ElementsTab> {
  ElementsTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    ElementsTabState state,
  ) {
    if (state.status == ElementTabStatus.error) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElementsTabCubit, ElementsTabState>(
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

  Widget _buildBody(ElementsTabState state) {
    switch (state.status) {
      case ElementTabStatus.loading:
        return const Center(child: AnimatedLogo());
      case ElementTabStatus.error:
        return ErrorView(onPressed: cubit.loadElements);
      case ElementTabStatus.success:
        return ListView.separated(
          itemBuilder: (_, index) {
            return ElementTile(element: state.elements[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemCount: state.elements.length,
        );
    }
  }
}
