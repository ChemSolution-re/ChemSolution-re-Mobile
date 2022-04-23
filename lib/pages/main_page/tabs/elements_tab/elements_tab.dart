import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/main_page/elements_tab/elements_tab_cubit.dart';
import '../../../../di/locator.dart';
import '../../../../utils/chem_solution_toasts.dart';
import '../../../../views/chem_solution_app_bar.dart';

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
        return const Scaffold(
          appBar: ChemSolutionAppBar(
            isLeadingIconEnabled: false,
            // isSearching: isSearching,
            // onSearchIconPressed: _onSearchIconPress,
          ),
        );
      },
    );
  }
}
